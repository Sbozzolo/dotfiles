;;; My config
(add-to-list 'load-path "~/.emacs.d/els/")
(require 'cuda-mode)
(autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))
(load-file "~/.emacs.d/sensible-defaults.el/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/bind-commenting-and-uncommenting)
(custom-set-variables
 '(python-guess-indent nil)
 '(python-indent 4))

;; To manage key bindings
(require 'bind-key)

;;To encrypt
(require 'epa-file)
;;; (epa-file-enable)

;;To have YASnippet working in LaTeX
(defun disable-final-newline ()
  (interactive)
  (set (make-local-variable 'require-final-newline) nil))

;; AucTeX defaults
(setq LaTeX-math-list '(
                        (?, "partial" nil)))
(setq TeX-parse-self t)
(setq TeX-auto-save t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook `Plain-TeX-mode-hook
          (lambda () (set (make-variable-buffer-local ’TeX-electric-math)
                     (cons "$" "$"))))
(add-hook `LaTeX-mode-hook
          (lambda () (set (make-variable-buffer-local ’TeX-electric-math)
                     (cons "\\(" "\\)"))))

;; Spelling checker
(add-hook 'LaTeX-mode-hook '(flyspell-mode t))
;;; (require 'flyspell-babel)
;;; (require 'ispell-multi)
;;; (add-hook 'LaTeX-mode-hook 'flyspell-babel-setup)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; Theme changer
;; (setq calendar-location-name "Milan, IT")
;; (setq calendar-latitude 45.63)
;; (setq calendar-longitude 9.04)
;; (require 'theme-changer)
;; (change-theme 'sanityinc-solarized-light 'sanityinc-solarized-dark)

;; Copy whole line
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

;;; Open LCM shell
(defun lcm-shell ()
  (interactive)
  (let ((default-directory "/ssh:sbozzolo@lcm.mi.infn.it:"))
    (shell))
  (setq default-directory "~/")
  )

;;; To kill line backwards
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(bind-key "C-c k" 'backward-kill-line)

;;; Guru mode, to become an Emacs guru!
(guru-global-mode +1)

;;; Rebind C-x k to kill this buffer
(bind-key "C-x k" 'kill-this-buffer)

(provide 'init-local)
;;; init-local ends here
