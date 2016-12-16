
(setq user-full-name "Gabriele Bozzola"
      user-mail-address "sbozzolator@gmail.com"
      calendar-latitude 45.63
      calendar-longitude 9.04
      calendar-location-name "Milan, Italy")

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

(global-font-lock-mode t)

(setq confirm-kill-emacs 'y-or-n-p)

(require 'package)
(setq package-enable-at-startup nil)
;; org
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; MELPA
(add-to-list 'package-archives `("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(require 'server)
(unless (server-running-p)
  (server-start))

(setq vc-follow-symlinks t)

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(setq sentence-end-double-space nil)
