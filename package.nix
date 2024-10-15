{
  runCommand,
  emacsPackagesFor,
  emacs30-pgtk,
  makeWrapper,
}: let
  emacsPackage = (emacsPackagesFor emacs30-pgtk).emacsWithPackages (
    epkgs:
      with epkgs; [
        # Use-package
        use-package
        meow
      ]
  );
in
  runCommand "emacs-config"
  {
    nativeBuildInputs = [makeWrapper];
    meta.mainProgram = "emacs";
  }
  ''
    cp -rs ${emacsPackage} $out
    chmod -R a+w $out/*
    wrapProgram $out/bin/emacs \
        --add-flags "--init-directory=${./.}"
  ''
