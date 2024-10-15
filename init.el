;; Disable default UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(column-number-mode t)
(line-number-mode t)
(global-hl-line-mode t)

(global-display-line-numbers-mode t)

;; Fonts
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 110)

(require 'base16-cyberdream-theme)
(setq base16-theme-256-color-source 'colors)
(load-theme 'base16-cyberdream t)

;; Tabs
(require 'centaur-tabs)
(centaur-tabs-mode t)

;; Indent Guide
(require 'indent-guide)
(setq indent-guide-char ":")

;; Keymaps
(require 'meow)
(meow-global-mode 1)

(setq meow-use-cursor-position-hack t) ;; meow-append
(meow-define-keys
  ;; state
  'normal

  '("0" . meow-expand-0)
  '("9" . meow-expand-9)
  '("8" . meow-expand-8)
  '("7" . meow-expand-7)
  '("6" . meow-expand-6)
  '("5" . meow-expand-5)
  '("4" . meow-expand-4)
  '("3" . meow-expand-3)
  '("2" . meow-expand-2)
  '("1" . meow-expand-1)
  '(")" . meow-forward-slurp)
  '("(" . meow-forward-barf)
  '("{" . meow-backward-slurp)
  '("}" . meow-backward-barf)
  '("-" . negative-argument)
  '(";" . meow-reverse)
  '("," . meow-inner-of-thing)
  '("." . meow-bounds-of-thing)
  '("[" . meow-beginning-of-thing)
  '("]" . meow-end-of-thing)
  '("b" . meow-back-word)
  '("B" . backward-word)

  '("c" . meow-change)

  '("d" . delete-region)

  '("gg" . beginning-of-buffer)
  '("G" . end-of-buffer)
  '("h" . meow-left)
  '("H" . meow-left-expand)
  '("j" . meow-next)
  '("J" . meow-next-expand)
  '("k" . meow-prev)
  '("K" . meow-prev-expand)
  '("l" . meow-right)
  '("L" . meow-right-expand)
  '("m" . avy-goto-char-timer)
  '("o" . meow-open-below)
  '("O" . meow-open-above)

  '("p" . meow-yank)

  '("Q" . meow-goto-line)
  '("r" . meow-replace)
  '("r" . meow-swap-grab)
  '("s" . meow-grab)

  '("t" . meow-till)
  '("u" . meow-undo)
  '("U" . undo-redo)

  '("v" . meow-block)
  '("V" . meow-to-block)
  '("?" . comment-dwim)
  '("w" . meow-next-word)
  '("W" . forward-word)

  '("X" . meow-line-expand)
  '("y" . meow-save)
  '("Y" . meow-sync-grab)
  '("z" . meow-pop-selection)
  '("." . repeat)
  '("<escape>" . meow-cancel-selection)
  '("%" . meow-query-replace)
  '("&" . meow-query-replace-regexp)

  ;; Search
  '("/" . meow-visit)
  '("n" . meow-search)

  ;; Switch into insert mode
  '("i" . meow-insert)
  '("I" . (lambda () (interactive) (beginning-of-line-text) (meow-insert)))
  '("a" . meow-append)
  '("A" . (lambda () (interactive) (end-of-line) (meow-append)))

  ;; Custom
  '("x" . delete-char)
  '("C-c" . comment-line)
)

(meow-leader-define-key
  '("w" . save-buffer)
  '("f" . find-file)
  '("?" . meow-cheatsheet)
  '("bn" . centaur-tabs-forward)
  '("bb" . centaur-tabs-backward))

(require 'move-dup)
(global-set-key (kbd "M-k") 'move-dup-move-lines-up)
(global-set-key (kbd "M-j") 'move-dup-move-lines-down)

;; Window Prefix
(defvar-keymap my-window-prefix-map
  "v" 'split-window-right
  "s" 'split-window-below
  "q" 'delete-window
  "w" 'other-window
  "h" 'windmove-left
  "l" 'windmove-right
  "k" 'windmove-up
  "j" 'windmove-down)
(keymap-set global-map "C-w" my-window-prefix-map)

;; Toggle Prefix
(defvar-keymap my-toggle-prefix-map
  "n" 'display-line-numbers-mode)
(keymap-set global-map "\\" my-toggle-prefix-map)
