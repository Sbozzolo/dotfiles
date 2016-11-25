
(setq user-full-name "Gabriele Bozzola"
      user-mail-address "sbozzolator@gmail.com"
      calendar-latitude 45.63
      calendar-longitude 9.04
      calendar-location-name "Milan, Italy")

(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/els/")

(autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))

(load-file "~/.emacs.d/sensible-defaults.el/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/bind-commenting-and-uncommenting)

(setq LaTeX-math-list '((?, "partial" "Misc Symbol" 8706)))
;; NOT WORKING!!!
;;(setq LaTeX-math-list (append '(?o "circ" "Binary Operator" .) LaTeX-math-list))
;;(setq LaTeX-math-list (append '(?= "cong" "Binary Operator" ) LaTeX-math-list))
(setq TeX-parse-self t)
(setq TeX-auto-save t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'plain-TeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
                          (cons "$" "$"))))

(require 'bind-key)
(require 'epa-file)

(defun lcm-shell ()
  (interactive)
  (let ((default-directory "/ssh:sbozzolo@lcm.mi.infn.it:"))
    (shell))
  (setq default-directory "~/")
  )

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(bind-key "C-c k" 'backward-kill-line)

(bind-key "C-x k" 'kill-this-buffer)

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (when mark-active
      (if (> (point) (mark))
          (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
        (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(bind-key "C-c c" 'copy-line)

(global-prettify-symbols-mode t)
(add-hook 'LaTeX-mode-hook
            (lambda ()
              (push '("\\colon" . ?:) prettify-symbols-alist)))
(add-hook 'LaTeX-mode-hook
            (lambda ()
              (push '("\\pm" . ?±) prettify-symbols-alist)))
(add-hook 'LaTeX-mode-hook
            (lambda ()
              (push '("\\dots" . ?…) prettify-symbols-alist)))
(add-hook 'LaTeX-mode-hook
            (lambda ()
              (push '("\\rrbracket" . 10215) prettify-symbols-alist))) ;;;⟧
(add-hook 'LaTeX-mode-hook
            (lambda ()
              (push '("\\llbracket" . 10214) prettify-symbols-alist))) ;;;⟦
(add-hook 'LaTeX-mode-hook
            (lambda ()
              (push '("\\incl" . ?↪) prettify-symbols-alist)))

(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode t)))
(setq org-ellipsis "⤵")
(setq org-src-fontify-natively t)

(use-package guru-mode
  :ensure t
  :init
  (guru-global-mode +1))
;; (require 'guru-mode)

(fset 'euro
   (lambda (&optional arg) "Keyboard macro." (interactive "p")
(kmacro-exec-ring-item (quote ([24 56 return 35 120 50 48 65 67 return] 0 "%d")) arg)))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(bind-key "C-y" 'counsel-yank-pop)

(bind-key "<f5>" 'revert-buffer)

(bind-key "C-s" 'swiper)
(bind-key "C-r" 'swiper)

;; last t is for NO-ENABLE
(load-theme 'sanityinc-solarized-dark t t)
(load-theme 'tango-dark t t)

(defun mb/pick-color-theme (frame)
  (select-frame frame)
  (if (window-system frame)
      (progn
        (disable-theme 'tango-dark) ; in case it was active
        (enable-theme 'sanityinc-solarized-dark))
    (progn
      (disable-theme 'sanityinc-solarized-dark) ; in case it was active
      (enable-theme 'tango-dark))))
(add-hook 'after-make-frame-functions 'mb/pick-color-theme)

;; For when started with emacs or emacs -nw rather than emacs --daemon
(if window-system
    (enable-theme 'sanityinc-solarized-dark)
  (enable-theme 'tango-dark))
