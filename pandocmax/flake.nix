{
  description = "A report built with Pandoc, XeLaTex and a custom font";

  inputs = {
      nixpkgs.url = "nixpkgs";
      styles.url = github:citation-style-language/styles;
      styles.flake = false;
      dgram.url = github:mmesch/dgram;
  };
  outputs = { self, nixpkgs, styles, dgram }: {

    packages.x86_64-linux.pandocWithDiagrams = (
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            fonts = pkgs.makeFontsConf { fontDirectories = [ pkgs.dejavu_fonts ]; };
        in
          pkgs.writeShellApplication {
            name = "pandoc-dgram";
            runtimeInputs =
                with pkgs; [
                  pandoc
                  haskellPackages.pandoc-crossref
                  texlive.combined.scheme-small
                    ];
            text = ''
              echo "converting"
              export FONTCONFIG_FILE=${fonts}
              pandoc \
                  --lua-filter=${dgram.packages.x86_64-linux.pandocScript}/dgram.lua \
                  --filter pandoc-crossref \
                  -M date="$(date "+%B %e, %Y")" \
                  --csl ${styles}/chicago-fullnote-bibliography.csl \
                  --citeproc \
                  --pdf-engine=xelatex \
                  "$@"
              echo "pandoc done"
              '';
          }
        );

        packages.x86_64-linux.default = self.packages.x86_64-linux.pandocWithDiagrams;
  };
}
