;; Global
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun delete-char-or-region()
	(interactive)
	(if (region-active-p)
		(progn (meow-save) (delete-active-region))
		(meow-delete)))

(defun toggle-letter-case()
  (interactive)
  (let ((char-at-point (char-after)))
    (delete-char 1)
    (cond
     ((equal (upcase char-at-point) char-at-point)
      (insert (downcase char-at-point)))
     ((equal (downcase char-at-point) char-at-point)
      (insert (upcase char-at-point)))
     (t nil))))

(defun toggle-word-case()
  (interactive)
  (let ((deactivate-mark nil) xp1 xp2)
    (if (region-active-p)
        (setq xp1 (region-beginning) xp2 (region-end))
      (save-excursion
        (skip-chars-backward "[:alpha:]")
        (setq xp1 (point))
        (skip-chars-forward "[:alpha:]")
        (setq xp2 (point))))
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (upcase-initials-region xp1 xp2)
      (put this-command 'state 1))
     ((equal 1 (get this-command 'state))
      (upcase-region xp1 xp2)
      (put this-command 'state 2))
     ((equal 2 (get this-command 'state))
      (downcase-region xp1 xp2)
      (put this-command 'state 0)))))

(defvar-keymap my-window-map
  "v" 'split-window-right
  "s" 'split-window-below
  "q" 'delete-window
  "C-w" 'other-window)

(defvar-keymap my-toggle-map
  "o" 'org-mode
  "p" 'prog-mode
  "c" 'hl-line-mode
  "m" 'menu-bar-mode
  "n" 'display-line-numbers-mode)
  ;; "g" 'my-toggle-global-prefix-map)

;; Meow
(use-package meow
  :demand t
   :bind (
     ("M-k" . 'move-dup-move-lines-up)
     ("M-j" . 'move-dup-move-lines-down))

	:config
	(setq meow-use-clipboard t)
	(setq meow-expand-hint-remove-delay 1)
	(setq meow-use-cursor-position-hack t)
  (setq meow-use-enhanced-selection-effect t)
	(setq meow-cheatsheet-layout-meow-cheatsheet-layout-qwerty t)

	(meow-leader-define-key
	 '("w" . save-buffer)
	 '("d" . kill-buffer)
	 '("ff" . find-file)
	 '("?" . meow-cheatsheet))

	(meow-motion-overwrite-define-key
	 '("d" . delete-active-region))

	(meow-normal-define-key
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

	 '("/" . meow-visit)
	 '(";" . meow-reverse)
	 '("-" . negative-argument)
	 '("[" . meow-beginning-of-thing)
	 '("]" . meow-end-of-thing)

	 '("a" . meow-append)
	 '("A" . (lambda () (interactive) (end-of-line) (meow-insert)))
	 '("b" . meow-back-word)
	 '("B" . meow-back-symbol)
	 '("c" . meow-change)
	 '("d" . delete-char-or-region)
	 '("D" . (lambda () (interactive) (meow-save) (kill-line)))
	 '("G" . meow-grab)
	 '("ge" . end-of-buffer)
	 '("gg" . beginning-of-buffer)
	
 	 '("h" . meow-left)
 	 '("H" . meow-left-expand)
 	 '("i" . meow-insert)
 	 '("I" . (lambda () (interactive) (beginning-of-line-text) (meow-insert)))
 	 '("j" . meow-next)
 	 '("J" . meow-next-expand)
 	 '("k" . meow-prev)
 	 '("K" . meow-prev-expand)
 	 '("l" . meow-right)
 	 '("L" . meow-right-expand)
 	 '("m" . meow-mark-word)
 	 '("M" . meow-mark-symbol)

	 '("p" . meow-yank)
 	 '("r" . meow-replace)
 	 '("o" . meow-open-below)
 	 '("O" . meow-open-above)
 	 '("t" . meow-till)
 	 '("u" . meow-undo)
 	 '("U" . undo-redo)
 	 '("w" . meow-next-word)
	 '("w" . meow-next-symbol)
	 '("x" . meow-line)
	 '("y" . meow-save)
 
 	 '("<escape>" . meow-cancel-selection)

 	 ;; Customs
	 '("`" . toggle-word-case)
   '("~" . toggle-letter-case)

	 ;; Centaur
	 '("M-l" . centaur-tabs-forward)
	 '("M-h" . centaur-tabs-backward)

	 ;; Window movement
   '("C-c" . comment-line)
	 '("C-h" . windmove-left)
	 '("C-j" . windmove-down)
	 '("C-k" . windmove-up)
	 '("C-l" . windmove-right)

	 '(":" . "M-x")
	 (cons "\\" my-toggle-map)
	 (cons "C-w" my-window-map))

  (meow-global-mode 1))

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
