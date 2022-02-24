;; Inhibit default Emacs dashboard
(setq inhibit-startup-message t)


(setq custom-file "~/.emacs.d/custom.el")                                 ; Avoid the auto-generation of certain Elisp at the end of this file
(load custom-file)

(scroll-bar-mode -1)                                                      ; Disable visible scrollbar
(tool-bar-mode -1)                                                        ; Disable the toolbar
(menu-bar-mode -1)                                                        ; Disable the menu bar
(set-fringe-mode 20)                                                      ; Add fringes and consequently, breathing room
(menu-bar--display-line-numbers-mode-relative)                            ; Enable relative line numbering
(column-number-mode)                                                      ; Display the column number in the status bar

(dolist (mode '(text-mode-hook                                            ; Enable relative line numbering for certain buffers only
		prog-mode-hook
		conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq ring-bell-function 'ignore                                          ; Disable audio bell
      visible-bell nil)                                                   ; Disable visual bell

(set-face-attribute 'default nil
		    :font "Fira Code"
		    ; :weight 'Regular
		    :height 140)
; (set-face-attribute 'fixed-pitch nil
		    ; :font "Fira Code"
		    ; :weight 'Bold
		    ; :height 140)
; (set-face-attribute 'variable-pitch nil
		    ; :font "Source Sans Pro"
		    ; :weight 'Regular
		    ; :height 140)

(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))                        ; Scroll one line at a time
      mouse-wheel-progressive-speed nil                                   ; Don't accelerate scrolling
      mouse-wheel-follow-mouse 't                                         ; Scroll window under mouse
      scroll-step 1)                                                      ; Keyboard scroll one line at a time

(set-default-coding-systems 'utf-8)                                       ; Set default encoding system

(setq help-window-select t)                                               ; Switch to help buffers as they are opened

; (setq-default indent-tabs-mode nil)                                       ; Always use spaces instead of tabs when indenting
; (define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)                 ; Now, tab-stop-list is the only variable controlling indentation
; (setq tab-stop-list (number-sequence 4 120 4))                            ; The first tab will indent by 4 spaces, the second by 8, etc.

(require 'package)                                                        ; Initialize package sources

(setq package-archives '(("melpa" . "https://melpa.org/packages/")        ; Set Emacs remote package repositories
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents                                          ; Checks whether package-archive-contents are loaded, loads them if not
  (package-refresh-contents))
(unless (package-installed-p 'use-package)                                ; Initialize use-package on non-Linux platforms
  (package-install 'use-package))
(require 'use-package)                                                    ; Load the use-package package
(setq use-package-always-ensure t)

(use-package gruvbox-theme)                                               ; Gruvbox!
(load-theme 'gruvbox t)                                                   ; Set the theme

; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)                   ; Make the escape key quit prompts

(use-package undo-fu)                                                     ; Lightweight undo system of choice
(use-package evil                                                         ; Vim in Emacs
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-integration t)                                          ; This is optional since it's already true by default
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
; (evil-define-key 'insert 'global "ii" 'evil-normal-state)               ; Doesn't work

(use-package ivy                                                          ; Adding and settings up the complet framework
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich                                                     ; Richer Ivy completion (documentation strings)
  :init
  (ivy-rich-mode 1))

; (global-unset-key (kbd "C-x C-b"))
(use-package counsel                                                      ; A collection of Ivy-enhanced versions of common Emacs commands
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
   ("C-x C-b" . 'counsel-switch-buffer)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))                                    ; Don't start searches with ^

(use-package smex)

(use-package helpful                                                      ; Better help menus
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-modeline                                                ; A minimal replacement for the default modeline
  :hook (after-init . doom-modeline-mode))
(setq doom-modeline-icon nil)                                             ; Disable the modeline icons

(setq tab-bar-close-button-show nil                                       ; Configuring the appearance of the built-in Tab Bar
      tab-bar-new-button-show nil)

(use-package which-key                                                    ; Keybinding helper popup
  :config
  (which-key-mode))

(use-package rainbow-delimiters                                           ; Highlighting matching parentheses
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package winum                                                        ; Allowing for navigating windows and frames using numbers
  :config (winum-mode))

(use-package projectile                                                   ; Adding additional project management tools
  :diminish
  projectile-mode
  :config
  (projectile-mode +1)
  :demand t
  :bind-keymap
  ("C-c p" . projectile-command-map))
  ; :init
  ; (when (file-directory-p "~/Projects/Code")
    ; (setq projectile-project-search-path '("~/Projects/Code")))
  ; (setq projectile-switch-project-action #'dw/switch-project-action))

(use-package counsel-projectile                                           ; Interacting with Projectile through Counsel
  :after projectile
  :bind (("C-M-p" . counsel-projectile-find-file))
  :config
  (counsel-projectile-mode))

(use-package treemacs                                                     ; Adding a popular file explorer
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-magit
  :after (treemacs magit))

(use-package treemacs-persp                                               ; treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode)                                            ; Or perspective vs. persp-mode
  :config (treemacs-set-scope-type 'Perspectives))

(use-package tree-sitter)                                                 ; Structural syntax highlighting
(use-package tree-sitter-langs)
(use-package evil-textobj-tree-sitter)                                    ; Brings support for custom Tree Sitter syntax tree based text objects
(use-package tree-sitter-indent)
(global-tree-sitter-mode)                                                 ; Turning on the minor mode for syntax tree generation globally
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)               ; Activating syntax highlighting for every buffer
; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-indent-mode)           ; BUGGY Resolve indentation
(define-key evil-outer-text-objects-map "f"                               ; Example, adding an outer function text object to Evil mode
  (evil-textobj-tree-sitter-get-textobj "function.outer"))
(define-key evil-inner-text-objects-map "f"                               ; Example, adding an inner function text object to Evil mode
  (evil-textobj-tree-sitter-get-textobj "function.inner"))

(use-package centered-cursor-mode                                         ; Cursor is centered, allows for better scrolling
  :config
  (global-centered-cursor-mode))

(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/Documents/Notes/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))                    ; Dailies
  :config
  (setq org-roam-node-display-template
        (concat "${title:*} "
                (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))                                            ; Completion?
  ; (require 'org-roam-protocol)

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode                                                     ; Language Server Protocol support
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")                                        ; Set prefix for lsp-command-keymap (few alternativews - "C-l", "C-c l")
  :config
  (lsp-enable-which-key-integration t))                                   ; Which Key integration with LSP mode

(use-package company                                                      ; The ultimate code completion backend
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind ((:map company-active-map
	       ("<tab>" . company-complete-selection))
	 (:map lsp-mode-map
	       ("<tab>" . company-indent-or-complete-common)))
  :custom
  (company-minimum-prefix-length 1)
  (company--idle-delay 0.0))
; (add-hook 'after-init-hook 'global-company-mode)                          ; Use Company mode globally

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package lsp-ui                                                         ; Fancy sideline, popup documentation
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-update-mode t)
  (lsp-ui-sideline-delay 0.2)
  (lsp-ui-peek-show-directory t)
  (lsp-ui-peek-enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-delay 0.2)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse t)
  (lsp-ui-imenu-window-width 40)
  ; (lsp-ui-imenu--custom-mode-line-format __)
  (lsp-ui-imenu-auto-refresh t)
  (lsp-ui-imenu-auto-refresh-delay 1)
  :config
  (lsp-ui-peek-jump-backward)
  (lsp-ui-peek-jump-forward))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-ivy)                                                     ; Provides on type completion alternative of xref-apropos using Ivy

;; (defun dw/set-js-indentation ()
;;   (setq js-indent-level 2)
;;    (setq evil-shift-width js-indent-level)
;;   (setq-default tab-width 2))

(use-package rjsx-mode                                                      ; Based on js2-mode, mode for better JavaScript editing
  :mode "\\.jsx?\\'"
  :hook
  (rjsx-mode . lsp-deferred))

(use-package json-mode
  :hook
  (json-mode . lsp-deferred))

(use-package apheleia
  :config
  (apheleia-global-mode +1))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package haskell-mode
  :mode "\\.hs\\'")

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package evil-numbers                                                 ; Emulate Vim's C-a and C-x functionality (increment and decrement)
  :config
  (evil-define-key '(normal visual) 'global (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "C-c -") 'evil-numbers/dec-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "C-c C-+") 'evil-numbers/inc-at-pt-incremental)
  (evil-define-key '(normal visual) 'global (kbd "C-c C--") 'evil-numbers/dec-at-pt-incremental))
  
(use-package eterm-256color                                               ; Extending term-mode
  :hook (term-mode . eterm-256color-mode))

(use-package vterm                                                        ; Faster terminal emulation (native, compiled)
  :commands vterm
  :config
  ; (setq term-prompt-regexp _)
  (setq vterm-max-scrollback 10000))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package forge)

(custom-theme-set-faces
  'user
  '(variable-pitch ((t (:family "ETBembo" :height 160 :weight thin))))
  '(fixed-pitch ((t ( :family "Fira Code Retina" :height 140)))))

(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
        ; (base-font-color     (face-foreground 'default nil 'default))
        ; (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
        (headline           `(:inherit default :weight bold)))

  (custom-theme-set-faces
    'user
    `(org-level-8 ((t (,@headline ,@variable-tuple :height 1.01))))
    `(org-level-7 ((t (,@headline ,@variable-tuple :height 1.01))))
    `(org-level-6 ((t (,@headline ,@variable-tuple :height 1.01))))
    `(org-level-5 ((t (,@headline ,@variable-tuple :height 1.01))))
    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(require 'org-indent)

(custom-theme-set-faces
  'user
  '(org-block ((t (:inherit fixed-pitch))))
  '(org-block-begin-line ((t (:inherit fixed-pitch))))
  '(org-block-end-line ((t (:inherit fixed-pitch))))
  '(org-code ((t (:inherit (shadow fixed-pitch)))))
  '(org-document-info ((t (:foreground "dark orange"))))
  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
  '(org-link ((t (:foreground "cornflowerblue" :underline t))))
  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ; '(org-property-value ((t (:inherit fixed-pitch))) t)
  ; '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  '(org-table ((t (:inherit fixed-pitch))))
  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  '(org-drawer ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  '(org-property-value ((t (:inherit fixed-pitch :weight bold :height 0.8))))
  '(org-special-keyword ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ⯆"
        org-hide-emphasis-markers t)

  (setq org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t)

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-colunmn 60)

  (setq org-agenda-files
        (file-expand-wildcards "~/.emacs.d/OrgFiles/*.org"))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
          (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq org-tag-alist
        '((:startgroup)
          ; Put mutually exclusive tags here
          (:endgroup)
          ("@errand" . ?E)
          ("@home" . ?H)
          ("@work" . ?W)
          ("agenda" . ?a)
          ("planning" . ?p)
          ("publish" . ?P)
          ("batch" . ?b)
          ("note" . ?n)
          ("idea" . ?i)
          ("thinking" . ?t)
          ("recurring" . ?r)))

  (setq org-agenda-custom-commands
        '(("d" "Dashboard"
           ((agenda "" ((org-deadline-warning-days 14)))
            (todo "NEXT"
                  ((org-agenda-overriding-header "Next Tasks")))
            (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

          ("n" "Next Tasks"
           ((todo "NEXT"
                  ((org-agenda-overriding-header "Next Tasks")))))

          ("W" "Work Tasks" tags-todo "+work")

          ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
           ((org-agenda-overriding-header "Low Effort Tasks")
            (org-agenda-max-todos 20)
            (org-agenda-files org-agenda-files)))

          ("w" "Workflow Status"
           ((todo "WAIT"
                  ((org-agenda-overriding-header "Waiting on External")
                   (org-agenda-files org-agenda-files)))
            (todo "REVIEW"
                  ((org-agenda-overriding-header "In Review")
                   (org-agenda-files org-agenda-files)))
            (todo "PLAN"
                  ((org-agenda-overriding-header "In Planning")
                   (org-agenda-todo-list-sublevels nil)
                   (org-agenda-files org-agenda-files)))
            (todo "BACKLOG"
                  ((org-agenda-overriding-header "Project Backlog")
                   (org-agenda-todo-list-sublevels nil)
                   (org-agenda-files org-agenda-files)))
            (todo "READY"
                  ((org-agenda-overriding-header "Ready for Work")
                   (org-agenda-files org-agenda-files)))
            (todo "ACTIVE"
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-files org-agenda-files)))
            (todo "COMPLETED"
                  ((org-agenda-overriding-header "Completed Projects")
                   (org-agenda-files org-agenda-files)))
            (todo "CANC"
                  ((org-agenda-overriding-header "Cancelled Projects")
                   (org-agenda-files org-agenda-files))))))))

(setq org-refile-targets
      '(("/home/agastya/.emacs.d/OrgFiles/Archive.org" :maxlevel . 1)
        ("/home/agastya/.emacs.d/OrgFiles/Tasks.org" :maxlevel . 1)))
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setq org-clock-sound "~/Downloads/ding.wav")

(defun efs/read-file-as-string (path)
  (with-temp-buffer
    (insert-file-contents path)
    (buffer-string)))

(setq org-capture-templates
      `(("t" "Tasks / Projects")
        ("tt" "Task" entry (file+olp "~/.emacs.d/OrgFiles/Tasks.org" "Inbox")
         "* TODO %?\n %U\n %a\n %i" :empty-lines 1)
        ("ts" "Clocked Entry Subtask" entry (clock)
         "* TODO %?\n %U\n %a\n %i" :empty-lines 1)

        ("j" "Journal Entries")
        ("jj" "Journal" entry
         (file+olp+datetree "~/.emacs.d/OrgFiles/Journal.org")
         "\n* %<%I:%M %p> = Journal :journal:\n\n%?\n\n"
         ; ,(efs/read-file-as-string "~/.emacs.d/OrgFiles/Daily.org")
         :clock-in :clock-resume
         :empty-lines 1)
        ("jm" "Meeting" entry
         (file+olp+datetree "~/.emacs.d/OrgFiles/Journal.org")
         "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
         :clock-in :clock-resume
         :empty-lines 1)

        ("w" "Workflows")
        ("we" "Checking email" entry (file+olp+datetree ,"~/.emacs.d/OrgFiles/Journal.org")
         "* Checking Email: :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

        ("m" "Metrics Capture")
        ("mw" "Weight" table-line (file+headline
                                   "~/.emacs.d/OrgFiles/Metrics.org" "Weight")
         "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

(define-key global-map (kbd "C-c j")
  (lambda () (interactive) (org-capture nil "jj")))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :defer t
  :hook (org-mode . efs/org-mode-visual-fill))
