{
  description = "my personal flake templates";

  outputs = { self }: {

    templates = {

      haskell = {
        path = ./haskell;
        description = "Simple Haskell application";
      };

    };

    defaultTemplate = self.templates.haskell;

  };
}
