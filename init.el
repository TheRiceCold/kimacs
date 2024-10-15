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
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 100)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font" :height 100)

(require 'meow)
(meow-global-mode 1)

(setq meow-use-cursor-position-hack t) ;; Append
(meow-define-keys
  ;; state
  'normal

  ;; Movement
  '("h" . meow-left)
  '("j" . meow-next)
  '("k" . meow-prev)
  '("l" . meow-right)

  '("w" . meow-next-word)
  '("W" . meow-next-word)
  '("b" . meow-back-word)
  '("B" . meow-back-symbol)

  '("C-u" . meow-page-up)
  '("C-d" . meow-page-down)

  '("]" . meow-end-of-thing)
  '("[" . meow-beginning-of-thing)


  ;'("G" . meow-end-of-thing -b)
  ;'("gg" . meow-beginning-of-thing -b)

  ;; Switch into insert mode
  '("i" . meow-insert)
  '("a" . meow-append)
  '("o" . meow-open-below)
  '("O" . meow-open-above)

  ;; Search
  '("/" . meow-visit)
  '("n" . meow-search)

  ;; Normal mode modifications
  '("." . meow-repeat)
  '("D" . meow-kill)
  ;'("x" . meow-delete)
  '("u" . meow-undo)

  '("C-c" . meow-comment)
  '("?" . meow-cheatsheet)
)
