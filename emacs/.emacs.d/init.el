;;; My config using org-mode

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(org-babel-load-file "~/.emacs.d/settings.org")
(provide 'init-local)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(package-selected-packages
   (quote
    (ledger-mode ledger pdf-tools whole-line-or-region whitespace-cleanup-mode which-key use-package undo-tree systemd synonyms smex smart-mode-line-powerline-theme session ox-reveal org-bullets noflet multi-term magit iflipb htmlize guru-mode google-translate flycheck-pos-tip exwm engine-mode counsel company color-theme-sanityinc-solarized auctex)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/charging ((t (:inherit sml/global :foreground "lawn green" :weight bold :height 1.1))))
 '(sml/discharging ((t (:inherit sml/global :foreground "Red" :weight bold :height 1.1)))))
