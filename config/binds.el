;; Keymaps
(require 'meow)
(setq meow-use-clipboard t)
(setq meow-expand-hint-remove-delay 0)
(setq meow-use-cursor-position-hack t) ;; meow-append
(setq meow-use-enhanced-selection-effect t)

(meow-global-mode 1)

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

  '("d" . (lambda () (interactive) (meow-save) (delete-active-region)))

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
  ;; '("P" . (lambda () (interactive) (meow-next) (meow-yank)))

  '("Q" . meow-goto-line)

  '("s" . meow-grab)

  '("t" . meow-till)
  '("u" . meow-undo)
  '("U" . undo-redo)

  '("w" . meow-next-word)
  '("W" . forward-word)

  '("V" . meow-line-expand)
  '("y" . (lambda () (interactive) (meow-line-expand) (meow-save)))

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
  '("A" . (lambda () (interactive) (end-of-line) (meow-insert)))

  ;; Custom
  '("x" . delete-char)
  '("C-c" . comment-line)
  
  '("C-h" . windmove-left)
  '("C-l" . windmove-right)
  '("C-k" . windmove-up)
  '("C-j" . windmove-down)
)

(meow-leader-define-key
  '("e" . "C-x C-j")
  '("d" . kill-buffer) 
  '("ff" . find-file)
  '("w" . save-buffer)
  '("b" . buffer-menu)
  '("fd" . find-name-dired)
  '("?" . meow-cheatsheet))

(require 'move-dup)
(global-set-key (kbd "M-k") 'move-dup-move-lines-up)
(global-set-key (kbd "M-j") 'move-dup-move-lines-down)

;; Window Prefix
(defvar-keymap my-window-prefix-map
  "v" 'split-window-right
  "s" 'split-window-below
  "q" 'delete-window
  "C-w" 'other-window)

(keymap-set global-map "C-w" my-window-prefix-map)

;; Toggle Prefix
(defvar-keymap my-toggle-prefix-map
  "n" 'display-line-numbers-mode)
(keymap-set global-map "\\" my-toggle-prefix-map)

;; dired
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(eval-after-load "dired" '(progn
  (define-key dired-mode-map "k" 'dired-previous-line)
  (define-key dired-mode-map "K" 'dired-previous-dirline)
  (define-key dired-mode-map "j" 'dired-next-line)
  (define-key dired-mode-map "J" 'dired-next-dirline)
  (define-key dired-mode-map "-" 'dired-up-directory)
  (define-key dired-mode-map "r" 'dired-do-rename)
  (define-key dired-mode-map "n" 'dired-create-empty-file)
  (define-key dired-mode-map "N" 'dired-create-directory)
  (define-key dired-mode-map "u" 'dired-undo)
))

(provide 'binds)
