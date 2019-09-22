;;; My config using org-mode


(let ((file-name-handler-alist nil))
  (setq package-enable-at-startup nil)
  (package-initialize)

  ;;(org-babel-load-file "~/.emacs.d/settings.org")
  (load-file "/home/sbozzolo/dotfiles/emacs/.emacs.d/settings.el")
  (provide 'init-local)
  )
