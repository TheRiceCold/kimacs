;; Disable default UI elements
(menu-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 10)

(setq visible-bell t)

;; Fonts
(defun dw/set-font-faces()
	(message "Setting faces!")
	
	(setq-default line-spacing 0.12)
	(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)
	(set-face-attribute 'variable-pitch nil :font "Ubuntu Nerd Font" :height 120)
	(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 110)
	(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
	(set-face-attribute 'font-lock-keyword-face nil :slant 'italic))

(if (daemonp)
		(add-hook 'after-make-frame-functions
							(lambda (frame)
								(setq doom-modeline-icon t)
								(with-selected-frame frame
									(dw/set-font-faces))))
	(dw/set-font-faces))

;; Theme
(require 'base16-cyberdream-theme)
(setq base16-theme-256-color-source 'colors)
(load-theme 'base16-cyberdream t)

;; Background Opacity
(add-to-list 'default-frame-alist '(alpha-background . 75))

;; ICONS
;; (use-package all-the-icons
;; 	:ensure t
;; 	:if (display-graphic p))

;; Statusline
(use-package doom-modeline
  :ensure t
	:init (doom-modeline-mode 1))


;; Tabline
(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-bar 'under
	centaur-tabs-set-icons t
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-height 24
	centaur-tabs-set-modified-marker t)
	(centaur-tabs-mode t))

;; Indent Guide
(require 'indent-guide)
(setq indent-guide-char "▏")
(indent-guide-global-mode t)

(use-package ivy
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))

(use-package ivy-rich
	:after ivy
	:init
	(ivy-rich-mode 1))

(use-package counsel
	:after ivy
	:config (counsel-mode))

(provide 'ui)
