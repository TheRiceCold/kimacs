(setq inhibit-startup-message t) ;; Don't show startup message
(setq backup-directory-alist '(("." . "~/.backups"))) ;; Backup files directory
(setq-default tab-width 2)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(ido-mode t)
(show-paren-mode t) ;; Show matching parenthesis

;; Programming mode hooks
(add-hook 'prog-mode-hook 'hl-todo-mode) ;; Show todo highlights
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; Show line numbers

;; Dired mode hooks
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Which key configuration
(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package popper
	:bind (("C-\\" . popper-toggle-latest))
	:custom
	(popper-window-height 12)
	(popper-reference-buffers '(eshell-mode
															vterm-mode
															help-mode
															compilation-mode))
	:config
	(popper-mode 1))
    
(popper-mode +1)
	
(provide 'utils)
