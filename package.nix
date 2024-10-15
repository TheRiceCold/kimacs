{
  runCommand,
  emacsPackagesFor,
  emacs30-pgtk,
  makeWrapper,
  callPackage,
}: let
  emacsPackage = (emacsPackagesFor emacs30-pgtk).emacsWithPackages (
    epkgs:
      with epkgs; [
        # Use-package
        meow
        vterm
        move-dup
        indent-guide
        centaur-tabs
        (callPackage ./theme.nix { })
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
