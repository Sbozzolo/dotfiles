;;; My config using org-mode

(setq package-enable-at-startup nil)
(package-initialize)

(org-babel-load-file "~/.emacs.d/settings.org")
(provide 'init-local)
