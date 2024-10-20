
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
        # Keybinds
        meow
        move-dup

        # UI
        dashboard
        indent-guide
        centaur-tabs
        all-the-icons
        doom-modeline
        # spacious-padding
        # dired-hacks-utils

        # LSP
        lsp-ui
        lsp-mode
	      nix-mode
        company
        company-box
        typescript-mode

      	# Utils
      	# vterm
        # vterm-toggle
        popper
        # zoxide
      	hl-todo
      	swiper
      	counsel
      	ivy-rich

        (callPackage ./theme.nix {})
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
