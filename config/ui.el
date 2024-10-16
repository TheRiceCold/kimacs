;; Disable default UI elements
(menu-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)
(scroll-bar-mode 0)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(column-number-mode t)
(line-number-mode t)
(global-hl-line-mode t)

(global-display-line-numbers-mode t)

(set-frame-parameter nil 'alpha-background 75) ; For current frame
(add-to-list 'default-frame-alist '(alpha-background . 75)) ; For all new frames henceforth

;; Fonts
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 110)

(require 'base16-cyberdream-theme)
(setq base16-theme-256-color-source 'colors)
(load-theme 'base16-cyberdream t)

(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'dashboard)
(dashboard-setup-startup-hook)

;; Icons
(when (display-graphic-p)
  (require 'all-the-icons))

;; Tabs
(require 'centaur-tabs)
(centaur-tabs-mode t)
(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'under)
(setq x-underline-at-descent-line t)
(setq centaur-tabs-set-close-button nil)
(global-set-key (kbd "M-h") 'centaur-tabs-backward)
(global-set-key (kbd "M-l") 'centaur-tabs-forward)

;; Indent Guide
(require 'indent-guide)
(setq indent-guide-char "▏")
(indent-guide-global-mode t)

(provide 'ui)
