{
  description = "my personal flake templates";

  outputs = { self }: {

    templates = {

      haskell = {
        path = ./haskell;
        description = "Simple Haskell application";
      };

      jupyterPyStats = {
        path = ./jupyterPyStats;
        description = "Jupyter Lab with stats libraries";
      };

      pandocmax = {
        path = ./pandocmax;
        description = "Pandoc with custom fonts, citations, references and diagrams";
      };

    };

    defaultTemplate = self.templates.haskell;

  };
}
