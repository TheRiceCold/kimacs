(dolist (path '("config" "ide" "org"))
  (add-to-list 'load-path (locate-user-emacs-file path)))

(require 'ui)
(require 'binds)
(require 'utils)

(require 'lsp)
(require 'lang)
