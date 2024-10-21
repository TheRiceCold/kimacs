{ emacsPackages, writeText, ... }:
emacsPackages.trivialBuild {
  pname = "base16-cyberdream-theme"; # Would use theme slug, but having it static avoids needing to pass values to the .el files
  version = "0.0.1";
  packageRequires = [emacsPackages.base16-theme];
  src =
    writeText "base16-cyberdream-theme.el" # lisp
    ''
      (require 'base16-theme)

      (defvar base16-colorscheme-colors
        '(:base00 "#16181a"
          :base01 "#1e2124"
          :base02 "#3c4048"
          :base03 "#7b8496"
          :base04 "#7b8496"
          :base05 "#ffffff"
          :base06 "#16181a"
          :base07 "#ffffff"
          :base08 "#ff6e5e"
          :base09 "#ffbd5e"
          :base0A "#f1ff5e"
          :base0B "#5eff6c"
          :base0C "#5ef1ff"
          :base0D "#5ea1ff"
          :base0E "#bd5eff"
          :base0F "#ff5ef1")
        "Base16 Cyberdream")

      ;; Define the theme
      (deftheme base16-cyberdream)

      ;; Add all the faces to the theme
      (base16-theme-define 'base16-cyberdream base16-colorscheme-colors)

      ;; Mark the theme as provided
      (provide-theme 'base16-cyberdream)

      ;; Add path to theme to theme-path
      (add-to-list 'custom-theme-load-path
        (file-name-directory
          (file-truename load-file-name)))

      (provide 'base16-cyberdream-theme)
    '';
}
