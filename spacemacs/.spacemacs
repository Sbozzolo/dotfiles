;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs-base

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     better-defaults
     ;; emacs-lisp
     ivy
     git
     latex
     ;; helm
     ;; lsp
     ;; markdown
     ;; multiple-cursors
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; syntax-checking
     exwm
     finance
     pass
     pdf
     shell
     spacemacs-completion
     spacemacs-defaults
     spacemacs-modeline
     spacemacs-editing
     spell-checking
     search-engine
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ; For password-store
                                      pinentry
                                      ; Spacemacs has a "search-engine" layer
                                      ; which is an overkill for what I need
                                      engine-mode
                                      ; Telegram
                                      telega
                                      ; Notifications
                                      alert
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    ; In layer ivy
                                    evil
                                    flx
                                    helm-menu
                                    ivy-rich
                                    ivy-xref
                                    ; In layer EXWM
                                    desktop-environment
                                    framemove
                                    ; In layer finance
                                    evil-ledger
                                    ; In layer git
                                    evil-magit
                                    git-link
                                    helm-git-grep
                                    helm-gitignore
                                    magit-gitflow
                                    magit-svn
                                    orgit
                                    smeargle
                                    ; In layer latex
                                    evil-matchit
                                    ggtags
                                    counsel-gtags
                                    helm-gitags
                                    magic-latex-buffer
                                    typo
                                    yasnippet
                                    ; In layer shell
                                    esh-help
                                    eshell-prompt-extras
                                    eshell-z
                                    helm
                                    multi-term
                                    projectile
                                    shell-pop
                                    terminal-here
                                    vi-tilde-fringe
                                    ; In layer spacemacs-completion
                                    flx-ido
                                    ; In layer spacemacs-modeline
                                    anzu
                                    doom-modeline
                                    neotree
                                    spaceline-all-the-icons
                                    symon
                                    vim-powerline
                                    ; In layer spacemacs-editing
                                    aggressive-indent
                                    editor-config
                                    hungry-delete
                                    link-hint
                                    lorem-ipsum
                                    origami
                                    password-generator
                                    pcre2el
                                    smartparens
                                    undo-tree
                                    uuidgen
                                    ; In layer spell-checking
                                    auto-dictionary
                                    flyspell-correct-helm
                                    flyspell-correct-popup
                                    flyspell-popup
                                    ; In layer pass
                                    helm-pass
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator bar :separator-scale 0.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 14.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "∇"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 10

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (cl-pushnew "DISPLAY" spacemacs-ignored-environment-variables)
  (cl-pushnew "TERM" spacemacs-ignored-environment-variables)
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;;; GENERAL SETTINGS

  ;; Backup settings -- life savers
  (setq backup-directory-alist    '(("." . "~/.emacs.d/backup"))
        tramp-backup-directory-alist   backup-directory-alist
        temporary-directory    '(("." . "~/.emacs.d/tmp"))
        undo-tree-directory    "~/.emacs.d/undo"
        vc-make-backup-files t ;; Use version control for backups
        version-control t     ;; Use version numbers for backups.
        kept-new-versions 10 ;; Number of newest versions to keep.
        kept-old-versions 5 ;; Number of oldest versions to keep.
        delete-old-versions t ;; Don't ask to delete excess backup versions.
        backup-by-copying t) ;; Copy all files, don't rename them.

  ;; Yank at point not where cursor is
  (when window-system (setq mouse-yank-at-point t))

  ;; Overwrite highlithed text
  (delete-selection-mode t)

  ;; When opening a file, always follow symlinks.
  (setq vc-follow-symlinks t)

  ;; Enable prettification everywhere
  (when window-system (global-prettify-symbols-mode t))

  ;;; LaTeX

  (use-package tex-site
    :ensure auctex
    :mode (("\\.tikz\\'" . LaTeX-mode)))

  ;; Tramp
  (use-package tramp
    :init
    ;; Use ssh controlmaster
    (setq tramp-default-method "ssh")
    (setq tramp-ssh-controlmaster-options
          (substitute-in-file-name (concat
                                    "-o ControlPath=$HOME/.ssh/ssh-%%r@%%h:%%p "
                                    "-o ControlMaster=auto -o ControlPersist=yes")))
    :config
    ;; Use $PATH of the remote machine
    (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
    (setq tramp-shell-prompt-pattern "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*"))


  ;;; Alert
  (use-package alert
    :defer t
    :custom (alert-default-style 'libnotify))

  ;;; EXWM

  ;; Movement keys
  (setq exwm-input-simulation-keys
        '(
          ;; movement
          ([?\C-b] . [left])
          ([?\M-b] . [C-left])
          ([?\C-f] . [right])
          ([?\M-f] . [C-right])
          ([?\C-p] . [up])
          ([?\C-n] . [down])
          ([?\C-a] . [home])
          ([?\C-e] . [end])
          ([?\M-v] . [prior])
          ([?\C-v] . [next])
          ([?\C-d] . [delete])
          ([?\C-k] . [S-end delete])
          ([?\C-m] . [return])
          ;; cut/paste.
          ([?\C-w] . [?\C-x])
          ([?\M-w] . [?\C-c])
          ([?\C-y] . [?\C-v])
          ;; search
          ([?\C-s] . [?\C-f])))

  ;; Hide minibuffer when not used
  (setq exwm-workspace-minibuffer-position 'bottom)

  ;; Rename EXWM buffers with the name of the application
  (defun exwm/rename-buffer ()
    (interactive)
    (exwm-workspace-rename-buffer
     ; Get first word of the name
     (concat "(" (car (split-string exwm-class-name "[ \f\t\n\r\v-]+")) ") "
             (if (<= (length exwm-title) 30) exwm-title
               (concat (substring exwm-title 0 29) "...")))))

  (defun exwm/shell-command-in-home-to-string (command)
    (let ((default-directory user-home-directory))
      (shell-command-to-string command)))

  ;; This function is used to bind keys for desktop env features, like
  ;; taking screenshot, changing brightness, and so on.
  ;; Running the command in the home is needed to avoid running the
  ;; command over TRAMP.
  ;; Also, alert notifications provide useful feedback.
  (defun exwm/bind-command-in-home-and-alert (key command title message)
    "Bind COMMAND to KEY, send an alert with TITLE and MESSAGE"
    (exwm-input-set-key (kbd key)
                        (lambda ()
                          (interactive)
                          (progn
                            (exwm/run-program-in-home command)
                            (alert message :title title)))))

  (defun exwm/bind-command-in-home-and-alert-with-output (key command title message-pre message-post)
    "Bind COMMAND to KEY, send an alert with TITLE and
MESSAGE-PRE command output MESSAGE-POST"
    (exwm-input-set-key (kbd key)
                        (lambda ()
                          (interactive)
                            (alert
                             (concat
                              message-pre
                              (substring (exwm/shell-command-in-home-to-string command) 0 -1)
                              message-post)
                             :title title))))

  ;; Bind Lock screen
  (setq exwm-locking-command "slock")

  ;; Bind X application
  (exwm/bind-command "s-c" "chromium --app=https://www.google.com")
  ;; What is this "--app" business?
  ;; Well, I believe that browser tabs are tremendously useless and distracting.
  ;; Hence, my chromium is not allowed to have tabs. Why should I keep the tabbar, then?
  ;; It turns out that it is quite difficult to remove the tabbar. A trick is to use
  ;; chromium in kiosk mode, which is what is being achieved here.

  (exwm/bind-command "s-<f2>" exwm-locking-command)

  (exwm/bind-command-in-home-and-alert "<print>"
                                       "import -window root ~/screenshots/$(date +%Y-%m-%d:%H:%M:%S).png"
                                       "Screenshot"
                                       "Screenshot taken! Saved in ~/screenshots")

  ;; Take a screenshot of part of the screen
  (exwm/bind-command-in-home-and-alert "<s-print>"
                                       "import ~/screenshots/$(date +%Y-%m-%d:%H:%M:%S).png"
                                       "Screenshot"
                                       "Screenshot taken! Saved in ~/screenshots")

  ;; Brightness
  (exwm/bind-command-in-home-and-alert-with-output "<XF86MonBrightnessDown>"
                                                   "sleep 0.05; xbacklight -get"
                                                   "Brightness"
                                                   "Brightness: "
                                                   " %")

  (exwm/bind-command-in-home-and-alert-with-output "<XF86MonBrightnessUp>"
                                                   "sleep 0.05; xbacklight -get"
                                                   "Brightness"
                                                   "Brightness: "
                                                   " %")

  ;; Volume
  (exwm/bind-command-in-home-and-alert-with-output "<XF86AudioRaiseVolume>"
                                                   "sleep 0.05; amixer get Master | grep '%'| cut -d'[' -f2 | cut -d '%' -f1"
                                                   "Volume"
                                                   "Volume: "
                                                   " %")

  (exwm/bind-command-in-home-and-alert-with-output "<XF86AudioLowerVolume>"
                                                   "sleep 0.05; amixer get Master | grep '%'| cut -d'[' -f2 | cut -d '%' -f1"
                                                   "Volume"
                                                   "Volume: "
                                                   " %")

  (exwm/bind-command-in-home-and-alert-with-output "<XF86AudioMute>"
                                                   "sleep 0.05; amixer get Master | grep '%'| cut -d'[' -f4 | cut -d']' -f1"
                                                   "Audio"
                                                   "Master is "
                                                   "")

  (exwm/bind-command-in-home-and-alert-with-output "<XF86AudioMicMute>"
                                                   "sleep 0.05; amixer get Capture | grep '%'| cut -d'[' -f4 | cut -d']' -f1 | head -n 1"
                                                   "Microphone"
                                                   "Microphone is "
                                                   "")

  ;; Bind "s-0" to "s-8" to switch to the corresponding workspace.
  (dotimes (i 9)
    (exwm-input-set-key (kbd (format "s-%d" i))
                        `(lambda ()
                           (interactive)
                           (exwm-workspace-switch-create ,i))))

  (use-package vterm-extra
    :defer t
    :load-path "~/documents/projects/2020/vterm-extra"
    :bind ("s-t" . vterm-extra-dispatcher))

  (defun activate-leader-in-exwm ()
    "Activate the leader key in EXWM.

At the moment, exwm-input-set-key is buggy.  Therefore,
we need to manually activate the leader key while Emacs is running."
    (interactive)
    (exwm-input-set-key (kbd "∇") spacemacs-default-map)
    (ignore-errors (exwm-input--update-global-prefix-keys)))

  ;;; Vterm
  (use-package vterm
    :bind
    (:map vterm-mode-map
          (("C-c C-k" . vterm-copy-mode)
           ;; Go to the top (bottom) of the buffer instead of sending M-> (M-<)
           ("M->" . nil)
           ("M-<" . nil)
           ;; Kill word with C-backspace
           ("<C-backspace>" . (lambda () (interactive) (vterm-send-key (kbd "C-w"))))
           )
          :map vterm-copy-mode-map ("C-c C-k" . vterm-copy-mode))
    :custom
    ((vterm-buffer-name-string "%s")     ;; Rename vterm buffers with the shell TITLE
     (vterm-kill-buffer-on-exit t)       ;; Don't leave vterm buffers around
     (vterm-always-compile-module t))      ;; Compile vterm-module without asking
    :config
    ;; I don't keep minor mode information in the mode-line, but I want to know
    ;; if VTermCopy is enabled or not.

    ;; TODO: Define spaceline segment

    ;; (spaceline-define-segment vterm-copy-mode
    ;;   "Docstring"
    ;;   "VTermCopy"

    ;;   :when  (bound-and-true-p vterm-copy-mode))
    ;; (spaceline-spacemacs-theme 'vterm-copy-mode)
    )

  ;;; Pinentry
  (use-package pinentry
    :config
    (setq epa-pinentry-mode 'loopback)
    ;; Disable external pin managers
    ;; [[https://www.masteringemacs.org/article/keeping-secrets-in-emacs-gnupg-auth-sources][Taken from here]]
    (setenv "GPG_AGENT_INFO" nil)
    (pinentry-start))

  ;;; Spaceline
  (use-package spaceline
    :config
    (fancy-battery-mode)
    (spaceline-toggle-battery-on)
    ;; Deactivate most segments
    (spaceline-toggle-buffer-size-off)
    (spaceline-toggle-persp-name-off)
    (spaceline-toggle-window-number-off)
    (spaceline-toggle-purpose-off)
    (spaceline-toggle-evil-state-off)
    (spaceline-toggle-hud-off)
    (spaceline-toggle-minor-modes-off)
    (spaceline-toggle-buffer-position-off)
    (spaceline-toggle-buffer-encoding-abbrev-off))

  ;;; Ivy
  (use-package ivy
    :diminish ivy-mode
    :bind
    (("C-x b" . ivy-switch-buffer)
     ("C-s" . counsel-grep-or-swiper)
     ("C-r" . swiper)
     :map ivy-minibuffer-map
     ("C-j" . ivy-immediate-done)
     ("RET" . ivy-alt-done)))

  (use-package expand-region
    :bind ("C-=" . er/expand-region))

  (use-package elec-pair
    :config
    (electric-pair-mode 1)
    ;; Electric $ $ in LaTeX
    :hook (LaTeX-mode . (lambda ()
                          (set (make-variable-buffer-local 'TeX-electric-math)
                                        (cons "$" "$")))))

  (use-package browse-url
    :config
    ;; This is to have a full screen chromium using the "-app="
    ;; trick. Apparently it works only if the protocol is specified
    (defun browse-url-chromium-app (url &optional _new-window)
      "Ask the Chromium WWW browser to load URL.
    Default to the URL around or before point.  The strings in
    variable `browse-url-chromium-arguments' are also passed to
    Chromium.
    The optional argument NEW-WINDOW is not used."
      (interactive (browse-url-interactive-arg "URL: "))
      (setq url (browse-url-encode-url url))
      ;; Check if url starts with http:// or https://, if not add it
      (unless
          (or (equal (substring url 0 7) "file://")
              (equal (substring url 0 7) "http://")
              (equal (substring url 0 8) "https://"))
        (setq url (concat "http://" url))
        )
      (let* ((process-environment (browse-url-process-environment)))
        (apply 'start-process
               url nil
               browse-url-chromium-program
               (append
                browse-url-chromium-arguments
                (list (concat "--app=" url)))))))

  ;; Engine-mode
  (use-package engine-mode
    :config
    (engine-mode t)

    ;; It seems that somewhere the value is overwritten
    (setq engine/browser-function 'browse-url-chromium-app)

    (defengine ads-abs
      "http://adsabs.harvard.edu/cgi-bin/basic_connect?qsearch=%s&version=1"
      :keybinding "a")

    (defengine google
      "https://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
      :keybinding "g")

    (defengine synonym
      "https://www.thesaurus.com/browse/%s"
      :keybinding "s")
    )

  ;; Telegram
  (use-package telega
    :custom ((telega-chat-title-emoji-use-images nil)
             (telega-emoji-use-images nil))
    :config
    (spacemacs/set-leader-keys "AT" 'telega))


  ;;; Spell checking
  (use-package flyspell
    :custom
    ((ispell-program-name "hunspell")
     (ispell-personal-dictionary (substitute-in-file-name "$HOME/.emacs.d/hunspell_dict.txt"))))
  
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" default))
 '(package-selected-packages
   '(auctex-latexmk auctex pdf-tools tablist alert log4e gntp solarized-theme telega rainbow-identifiers visual-fill-column web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode htmlize simple-httpd haml-mode engine-mode emmet-mode counsel-css web-completion-data company add-node-modules-path ws-butler string-inflection move-text expand-region eval-sexp-fu editorconfig clean-aindent-mode avy wgrep smex ivy-pass ivy-hydra helm-make counsel swiper ivy pinentry password-store ledger-mode delight spaceline s powerline fancy-battery font-lock+ magit-section magit gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger popup git-commit with-editor transient xterm-color vterm terminal-here shell-pop multi-term eshell-z eshell-prompt-extras esh-help dash unfill mwim which-key use-package pcre2el hydra hybrid-mode exwm dotenv-mode diminish bind-map async))
 '(safe-local-variable-values
   '((reftex-default-bibliography "bibliography.bib" "einsteintoolkit.bib")
     (TeX-command-extra-options . "-shell-escape")
     (projectile-project-run-cmd . "mkdir -p build; cd build; cmake ..; make run")
     (projectile-project-compilation-cmd . "mkdir -p build; cd build; cmake ..; make")))
 '(telega-chat-title-emoji-use-images nil)
 '(telega-emoji-use-images nil)
 '(vterm-always-compile-module t t)
 '(vterm-buffer-name-string "%s" t)
 '(vterm-kill-buffer-on-exit t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36")))))
)
