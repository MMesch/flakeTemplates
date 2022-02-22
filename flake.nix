{
  description = "my personal flake templates";

  outputs = { self }: {

    templates = {

      haskellSimple = {
        path = ./simple-container;
        description = "A NixOS container running apache-httpd";
      };

    };

    defaultTemplate = self.templates.trivial;

  };
}
