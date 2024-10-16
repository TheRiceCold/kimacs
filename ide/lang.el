;; Nix
(use-package nix-mode
  :mode "\\.nix\\'"
  :hook (nix-mode . lsp-deferred))

;; Typescript
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(provide 'lang)
