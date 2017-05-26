(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(font-latex-script-display (quote ((raise -0.2) raise 0.2)))
 '(package-selected-packages
   (quote
    (org-tree-slide paredit company-c-headers guess-language auto-package-update whole-line-or-region whitespace-cleanup-mode which-key use-package undo-tree systemd synonyms smex smart-mode-line-powerline-theme session pdf-tools org-bullets noflet multi-term magit ledger-mode iflipb htmlize guru-mode google-translate flycheck-pos-tip exwm expand-region engine-mode counsel company color-theme-sanityinc-solarized auctex)))
 '(safe-local-variable-values
   (quote
    ((eval ispell-change-dictionary "en_GB")
     (reftex-default-bibliography "/home/sbozzolo/master_thesis/thesis/biblio.bib")
     (reftex-default-bibliography "biblio.bib")
     (eval ispell-change-dictionary "en_US"))))
 '(session-use-package t nil (session))
 '(term-bind-key-alist
   (quote
    (("C-c C-c" . term-interrupt-subjob)
     ("C-c C-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("M-r" . isearch-backward)
     ("C-m" . term-send-return)
     ("C-a" . term-send-home)
     ("C-e" . term-send-end)
     ("C-y" . term-paste)
     ("M-f" . term-send-forward-word)
     ("M-b" . term-send-backward-word)
     ("M-o" . term-send-backspace)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("M-M" . term-send-forward-kill-word)
     ("M-N" . term-send-backward-kill-word)
     ("<C-backspace>" . term-send-backward-kill-word)
     ("C-r" . term-send-reverse-search-history)
     ("M-d" . term-send-delete-word)
     ("M-," . term-send-raw)
     ("M-." . comint-dynamic-complete)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/charging ((t (:inherit sml/global :foreground "lawn green" :weight bold :height 1.1))))
 '(sml/discharging ((t (:inherit sml/global :foreground "Red" :weight bold :height 1.1)))))
