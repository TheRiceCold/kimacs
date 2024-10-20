(use-package lsp-mode
  :init
  (setq lsp-auto-guess-root nil)
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(setq treesit-language-source-alist
      '((nix "https://github.com/nix-community/tree-sitter-nix")))

(provide 'lsp)

