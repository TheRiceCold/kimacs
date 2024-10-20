;; Global
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun toggle-case ()
  (interactive)
  (let ((char-at-point (char-after)))
    (delete-char 1)
    (cond
     ((equal (upcase char-at-point) char-at-point)
      (insert (downcase char-at-point)))

     ((equal (downcase char-at-point) char-at-point)
      (insert (upcase char-at-point)))

     (t nil))))

;; Meow
(use-package meow
  :demand t
   :bind (
    ; '("C-w q" . 'delete-window)
    ; '("C-w v" . 'split-window-right)
    ; '("C-w s" . 'split-window-below)
     ("M-k" . 'move-dup-move-lines-up)
     ("M-j" . 'move-dup-move-lines-down))

	:config
	(setq meow-use-clipboard t)
	(setq meow-expand-hint-remove-delay 0)
	(setq meow-use-cursor-position-hack t)
	(setq meow-use-enhanced-selection-effect t)

	(meow-leader-define-key
	 '("w" . save-buffer)
	 '("d" . kill-buffer)
	 '("ff" . find-file)
	 '("?" . meow-cheatsheet))

	(meow-normal-define-key
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
	 '("w" . meow-next-word)
	 '("W" . forward-word)
	 '("b" . meow-back-word)
	 '("B" . backward-word)

	 '("cw" . (lambda () (interactive) (meow-save) (meow-change)))
	 '("dd" . kill-whole-line)
	 '("dw" . (lambda () (interactive) (meow-save) (delete-region)))

	 '("G" . end-of-buffer)
	 '("gg" . beginning-of-buffer)
	 '("h" . meow-left)
	 '("H" . meow-left-expand)
	 '("j" . meow-next)
	 '("J" . meow-next-expand)
	 '("k" . meow-prev)
	 '("K" . meow-prev-expand)
	 '("l" . meow-right)
	 '("L" . meow-right-expand)
	 '("o" . meow-open-below)
	 '("O" . meow-open-above)

	 '("D" . kill-line)

	 '("p" . meow-yank)

   '("w" . meow-next-word)
   '("W" . forward-word)

   '("V" . meow-line-expand)

   ;; Search
   '("/" . meow-visit)
   '("n" . meow-search)

   ;; Switch into insert mode
	 
   '("i" . meow-insert)
   '("I" . (lambda () (interactive) (beginning-of-line-text) (meow-insert)))
   '("a" . meow-append)
   '("A" . (lambda () (interactive) (end-of-line) (meow-insert)))

   '("u" . meow-undo)
   '("U" . undo-redo)

   '("<escape>" . ignore)

   '("x" . delete-char)

   ;; Custom
   '("~" . toggle-case)
   '("C-c" . comment-line))

   (meow-global-mode 1))

;; keymap my-toggle-prefix-map
  ;; "o" 'org-mode
  ;; "p" 'prog-mode
  ;; "c" 'hl-line-mode
  ;; "m" 'menu-bar-mode
  ;; "n" 'display-line-numbers-mode)
  ;; "g" 'my-toggle-global-prefix-map)

;; Dired remap
(use-package dired
	:ensure nil
	:bind (:map dired-mode-map
		("k" . dired-previous-line)
		("K" . dired-previous-dirline)
		("j" . dired-next-line)
		("J" . dired-next-dirline)
		("-" . dired-up-directory)
		("r" . dired-do-rename)
		("n" . dired-create-empty-file)
		("N" . dired-create-directory)
		("u" . dired-undo)))

(provide 'binds)
