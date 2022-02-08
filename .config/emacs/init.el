(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
       ("org" . "https://orgmode.org/elpa/")
       ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;   (defvar bootstrap-version)
;;   (let ((bootstrap-file
;;          (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;         (bootstrap-version 5))
;;     (unless (file-exists-p bootstrap-file)
;;       (with-current-buffer
;;           (url-retrieve-synchronously
;;            "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;            'silent 'inhibit-cookies)
;;         (goto-char (point-max))
;;         (eval-print-last-sexp)))
;;     (load bootstrap-file nil 'nomessage))
;;
;;   (setq package-enable-at-startup nil)
;;
;;   (straight-use-package 'use-package)
;;   (setq package-enable-at-startup nil)
;;   (setq straight-use-package-by-default nil)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq vivible-bell t)

;; font face base on platform type
(pcase system-type
  ((or 'gnu/linux 'cygwin)
   (set-face-attribute 'default nil :font "Fira Code Retina" :height 85))
   ;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 60 :weight 'bold))
  ('windows-nt 
   (set-face-attribute 'default nil :font "Fira Code Retina" :height 100)))

(use-package doom-themes
:ensure t
:config
(setq doom-themes-enable-bold t
    doom-themes-enable-italic t)

(pcase system-type
  ('gnu/linux
   ;;(load-theme 'xresources t))
   (load-theme 'doom-palenight t))
  ('windows-nt
   (load-theme 'doom-palenight t)))

;;(load-theme 'doom-palenight t)
;;(load-theme 'doom-badger t)
;;(load-theme 'doom-one t)

(doom-themes-visual-bell-config))

;;(use-package nord-theme)
;;(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(pcase system-type
((or 'gnu/linux 'cygwin)
 (add-to-list 'default-frame-alist '(alpha . 90))))

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq beacon-color "#00ff00"))

(set-cursor-color "#00ff00")

(use-package evil-goggles
  :ensure t
  :after
  (evil)
  (evil-collection)
  :config
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))

(use-package page-break-lines
     :ensure t)


;;   (use-package init-open-recentf
;;     :config
;;     (recentf-mode 1)
;;     (setq recentf-max-menu-items 25)
;;     (init-open-recentf))

   (use-package dashboard
     :ensure t
     :config
     (setq dashboard-items '((recents . 10)
                             (bookmarks . 7)
                             (agenda . 15)
                             (registers . 7)))
     (setq dashboard-set-heading-icons t)
     (setq dashboard-set-file-icons t)
     (setq dashboard-startup-banner 'logo)
     (setq dashboard-center-content t)
     (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))) ;; this is needed to open *dashboar* buffer after startup
     :init
     (dashboard-setup-startup-hook))

(use-package rainbow-mode
  :ensure t)

(use-package ivy 
  :ensure t
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
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

  (use-package ivy-rich
    :ensure t
    :init
    (ivy-rich-mode 1)
    :after counsel
    :config
    (setq ivy-rich-path-style 'abbred)
    (setq ivy-rich-project-root-cache-mode 1))

  (use-package counsel
    :ensure t
    :bind (("M-b" . counsel-switch-buffer)
           ("M-x" . counsel-M-x)
           ("C-x C-f" . counsel-find-file)
           :map minibuffer-local-map
           ("C-r" . 'counsel-minibuffer-history))
    :custom
    (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
    :config
    (counsel-mode 1))

    (use-package all-the-icons-ivy
      :ensure t
      :init
      (add-hook 'after-init-hook 'all-the-icons-ivy-setup)
      :config
      (setq all-the-icons-ivy-buffer-commands '()))

(use-package ivy-prescient
   :after counsel
   :custom
   (ivy-prescient-enable-filtering nil)
   :config
   (ivy-prescient-mode 1))

;;      (use-package ivy-posframe
;;        :ensure t
;;        :config
;;          (setq ivy-posframe-display-function-alist
;;                '((swiper . ivy-posframe-display-at-point)
;;                  (complete-symbol . ivy-posframe-display-at-point)
;;                  (counsel-M-x . ivy-posframe-display-at-window-bottom-left)
;;                  (t . ivy-posframe-display)))
;;          (ivy-posframe-mode 1)
;;      )

(use-package ivy-bibtex
  :ensure t)

(use-package embark
  :ensure t
)

;;   (use-package helm
;;     :ensure t
;;     :bind
;;      (("M-x" . helm-M-x)
;;       ("C-x C-f" . helm-find-files)
;;        :map helm-map
;;        ("C-j" . helm-next-line)
;;        ("C-k" . helm-previous-line)
;;        )
;;     :config
;;     (helm-mode 1)
;;  )

;;  (use-package helm-swoop
;;    :ensure t
;;    :config
;;  )

(use-package helm-org-rifle
  :ensure t
)

(use-package deft
  :ensure t
  :config
  (setq deft-directory "~/work")
  (setq deft-recursive t)
  (setq deft-extensions '("org" "md"))
)

;;    (use-package vertico
;;      :init
;;        (vertico-mode))

(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init)

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :bind (("C-S-a" . embark-act)
        :map minibuffer-local-map
        ("C-d" . embark-act))
  :hook
  (embark-collect-mode . consult-preview-at-point-mode)
  :config
  ;; Show Embark actions via which-key - seems not yep working!
  (setq embark-action-indicator
        (lambda (map)
          (whick-key--show-keymap "Embark" map nil nil 'no-paging)
          #'which-key--hide-popop-ignore-command)
        embark-become-indicator embark-action-indicator))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package org
  :ensure nil
  :config
  ;;(setq org-ellipsis " ▼")
  (setq org-ellipsis " ⬎")
  (setq org-hide-emphasis-markers t)
  )

(setq org-agenda-include-diary t)
(setq org-log-done 'time)
(setq calendar-mark-holidays-flag t)
(setq org-agenda-files (apply 'append
 (mapcar
   (lambda (directory)
  (directory-files-recursively
    directory org-agenda-file-regexp))
       '("~/shared/" "~/work"))))
(setq calendar-latitude 51.107883)
(setq calendar-longitude 17.038538)
(setq calendar-location-name "Wrocław")

(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode)
  (setq org-agenda-custom-commands
    '(("z" "Super agenda view - work"
       ((agenda "" ((org-agenda-span 'day)
                   (org-super-agenda-groups
                    '((:name "Today"
                             :time-grid t
                             :date today
                             :todo "TODAY"
                             :scheduled today
                             :order 1)))))))))
)

(use-package org-superstar
  :ensure t
  :config
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "○" "▷" "⁖"))
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;; (use-package org-bullets
;;   :hook (org-mode . org-bullets-mode)
 ;;  :custom
 ;;  (org-bullets-bullet-list '("◉" "○" "✸" "✿" "○" "▷" "⁖")))

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
  (python . t)
  (plantuml . t)
  (ditaa . t)
  (latex . t)
 ;; (asymptote . t)
  (rust . t)
  (dot . t)
  ))
(setq org-confirm-babel-evaluate nil)

(use-package ob-rust
  :ensure t)

(use-package org-download
  :ensure t
  :config
  ;; add support for dired
  (add-hook 'dired-mode-hook 'org-download-enable)
)

(set-face-attribute 'org-document-title nil :font "Cantarell" :weight 'bold :height 1.3)
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1))))
;;(set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face))
;;(setq set-face-attribute (car face) nil
;;                         :font "Cantarell"
;;                         :weight 'regular
;;                         :height (cdr face)))

;;(setq org-capture-templates)

(use-package evil
:ensure t
:init
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)
(setq evil-undo-system 'undo-fu)
;; More fine undo configuration for evil undo system
(setq evil-want-fine-undo t)
:config
(evil-mode 1)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;; Use visual line motions even outside of visual-line-mode buffers
(evil-global-set-key 'motion "j" 'evil-next-visual-line)
(evil-global-set-key 'motion "k" 'evil-previous-visual-line)

(evil-set-initial-state 'messages-buffer-mode 'normal)
(evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
:ensure t
:after evil
:config
(evil-collection-init))

(use-package evil-tutor
  :ensure t)

;; (use-package undo-tree
 ;;  :init
 ;;  (global-undo-tree-mode 1)
;; )

(use-package undo-fu
  :ensure t
  :config
  ;;(global-undo-tree-mode -1)
  ;;(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  ;;(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)
 )

(use-package evil-org
  :ensure t
  :after org
  :hook ((org-mode . evil-org-mode)
    (org-agenda-mode . evil-org-mode)
    (evil-org-mode . (lambda () (evil-org-set-key-theme '(navigation todo insert textObjects additional)))))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  )

;;(use-package evil-commentary
;;  :ensure t
;;  :init
;;  (evil-commentary-mode)
;;)

(use-package evil-nerd-commenter
  :ensure t
  :init
  (evilnc-default-hotkeys))

(use-package org-roam
  :ensure t
  :hook
    (after-init . org-roam-mode)
  :custom
    (org-roam-directory "~/work/org-roam")
    (org-roam-completition-everywhere t)
    ;; wa for variable readings
    ;;(add-to-list 'safe-local-variable-values
    ;;        '(org-roam-directory . "."))
    (org-roam-capture-templates
    '(("d" "default" plain
       "%?"
       :if-new (file+head "${slug}.org" "#+TITLE: ${title}\n")
       :unnarrowed t)))
  :init
    (setq org-roam-v2-ack t)
  :config
    (org-roam-setup)
)

(use-package dash
  :ensure t)

(use-package org-roam-ui
      :ensure
;;        (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
        :after org-roam
;;    ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;    ;;         a hookable mode anymore, you're advised to pick something yourself
;;    ;;         if you don't care about startup time, use
;;    ;;  :hook (after-init . org-roam-ui-mode)
        :config
        (setq org-roam-ui-sync-theme t
              org-roam-ui-follow t
              org-roam-ui-update-on-save nil
              org-roam-ui-open-on-start nil))

;; not needed anymore as org-roam-ui available on melpa
;; (add-to-list 'load-path "~/.config/emacs/private/org-roam-ui")
;; (load-library "org-roam-ui")

;;(use-package simple_httpd
;;  :ensure t)

;;(use-package websocket
;;  :ensure t

(use-package org-roam-bibtex
  :after org-roam
  :config
  (require 'org-ref))

(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-habit t))
(setq org-habit-show-all-today t)

(use-package org-journal
  :ensure t
)

(use-package org-alert
  :ensure t
  :config
    (setq alert-default-style 'libnotify)
          org-alert-interval 30)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.2))

(use-package general
  :config
  (general-create-definer sy/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")

  (sy/leader-keys
    "SPC" '(counsel-M-x :whick-key "M-x")
    ;;"SPC" '(helm-M-x :whick-key "M-x")
    "a" '(:ignore t :which-key "applications")
    "ad" '(dired :whick-key "dired")
    "ae" '(elfeed :which-key "elfeed")
    "ar" '(ranger :Which-key "ranger")
    ;;"am" '(mu4e :which-key "mu4e")
    ;; Above line moved to emacs_init_priv.org not shared on github
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    ;;"tt" '(load-theme :whick-key "choose theme")
    "o" '(:ignore t :which-key "org-mode")
    "oa" '(org-agenda :whick-key "org-agenda")
    "oc" '(org-capture :whick-key "capture")
    "or" '(:ignore t :which-key "roam")
    "orf" '(org-roam-node-find :which-key "find node")
    "ori" '(org-roam-node-insert :which-key "insert node")
    ;;"b" '(:ignore t :which-key "buffers")
    "bb" '(consult-buffer :which-key "switch-buffer")
    ;;"bb" '(counsel-switch-buffer :which-key "switch-buffer")
    ;;"bb" '(helm-buffers-list :which-key "switch-buffer")
    "bn" '(next-buffer :which-key "next buffer")
    "bp" '(previous-buffer :whick-key "previuos-buffer")
    "bd" '(kill-buffer :whick-key "kill-buffer")
    "br" '(counsel-buffer-or-recentf :Which-key "recent")
    "f" '(:ignore t: :which-key "files")
    "ff" '(counsel-find-file :which-key "find")
    ;;"ff" '(helm-find-files :which-key "find")
    "fr" '(consult-recent-file :whick-key "recent")
    ;;"fr" '(counsel-recentf :which-key "recent")
    "g" '(:ignore t: :which-key "magit")
    "gs" '(magit-status :which-key "status")
    "l" '(:ignore t: :which-key "links")
    "ll" '(link-hint-open-link-at-point :which-key "open link")
    "lo" '(link-hint-open-link :which-key "show links")
    "s" '(:ignore t: :which-key "search")
    "ss" '(consult-line :which-key "lines")
    ;;"ss" '(swiper :whick-key "swiper")
    "sd" '(deft :which-key "deft")
    "sr" '(helm-org-rifle :which-key "rifle")
    "sR" '(helm-org-rifle-directories :which-key "rifle-dir")
    "sg" '(consult-ripgrep :which-key "ripgrep")
    ;;"ss" '(helm-swoop :whick-key "swoop")
    "w" '(:ignore t :which-key "windows")
    "w/" '(split-window-right :which-key "split-right")
    "wh" '(evil-window-left :which-key "left")
    "wj" '(evil-window-down :which-key "down")
    "wk" '(evil-window-up :which-key "up")
    "wn" '(evil-window-next :which-key "next")
    "wN" '(evin-window-new  :which-key "new")
    "wl" '(evil-window-right :which-key "right")
    "wd" '(evil-window-delete :which-key "delete")))

(use-package unicode-fonts
  :ensure t
  :config
  (unicode-fonts-setup))

(use-package emojify
  :commands emojify-mode)

(defun lg/presentation-start ()
  (beacon-mode 0)
  (setq text-scale-mode-amount 3)
  (text-scale-mode 1)
  (setq org-startup-with-inline-images t))

(defun lg/presentation-stop ()
  (beacon-mode 1)
  (text-scale-mode 0)
  (setq org-startup-with-inline-images nil))

(use-package org-tree-slide
  :hook ((org-tree-slide-play . lg/presentation-start)
         (org-tree-slide-stop . lg/presentation-stop))
  :ensure t
  :after org
  :config
  ;;(evil-define-key 'normal org-tree-slide-mode-map
  ;;  (kbd "C-j") 'org-tree-slide-move-next-tree
  ;;  (kbd "C-k") 'org-tree-slide-move-previous-tree
  ;;  (kbd "q") 'lg/org-end-presentation)
  (setq org-tree-slide-breadcrumbs " >> ")
  (setq org-tree-slide-activate-message "Presentation started")
  (setq org-tree-slide-deactivate-message "Presentation ended")
  (setq org-tree-slide-header t))

(use-package hide-mode-line
  :ensure t)

(use-package org-re-reveal
  :ensure t
  :config
  (setq org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"
        org-re-reveal-revealjs-version "4"))

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files
    (list "~/shared/elfeed/elfeed.org")))

(use-package elfeed
  :ensure t
  :config
  (setq elfeed-db-directory "~/elfeeddb")
  (setq-default elfeed-search-filter "@6-months-ago "))

(use-package elfeed-dashboard
  :ensure t
  :config
  (setq elfeed-dashboard-file "~/shared/elfeed/elfeed-dashboard.org")
  ;; update feed counts on elfeed-quit
  (advice-add 'efleed-search-quit-window :after #'elfeed-dashboard-update-links))

(use-package elfeed-goodies
:ensure t
:init
(elfeed-goodies/setup)
:config
(setq elfeed-goodies/entry-pane-position 'bottom)
(setq elfeed-goodies/feed-source-column-width 35)
)

(use-package dired
  :ensure nil)

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package ranger
  :ensure t)

(use-package mu4e-alert
  :ensure t
  :hook
    (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
  :config
    (setq mu4e-alert-set-default-style 'libnotify
          mu4e-alert-email-notification-types '(count))
)

(setq-default tab-width 2)
(setq-default evil-shift-with tab-width)

(setq-default indent-tabs-mode nil)

(use-package tex
  :ensure auctex)

(use-package link-hint
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package auto-complete
  :ensure t
  :init
  (progn
  (ac-config-default)
  (global-auto-complete-mode t))
)

;;(use-package org-ac
;;  :config
;;  (org-ac/config-default))

(use-package rust-mode
  :ensure t
  :config
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil)
)

(use-package magit
   :ensure t)

(use-package yang-mode
  :ensure t)

(use-package devdocs
  :ensure t)

(use-package dumb-jump
  :ensure t)

(use-package rfc-mode
  :ensure t
  :config
    (setq rfc-mode-directory (expand-file-name "~/rfc/"))
)

(pcase system-type
('windows-nt 
(setq org-plantuml-jar-path
    (expand-file-name "c:/programs/plantuml.jar"))
(setq org-ditaa-jar-path
    (expand-file-name "c:/programs/ditaa0_9.jar"))
))

(use-package command-log-mode)

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 22
        doom-modeline-minor-modes nil)
)

;;(use-package spaceline
;;  :ensure t
;;  :config
;;  (spaceline-spacemacs-theme))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;(use-package ox-reveal
;;	:ensure t)
;;(require 'ox-reveal)

(add-hook 'emacs-startup-hook
  (lambda ()
    (message "Emacs ready in %s with %d garbage collections."
      (format "%.2f seconds"
        (float-time
          (time-subtract after-init-time before-init-time)))
                         gcs-done)))


;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; The rest of the init file.

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

(use-package xresources-theme
  :ensure t)

(let ((init_priv "~/shared/emacs/init_priv.el"))
     (when (file-exists-p init_priv)
           (load-file init_priv)))

(let ((init_work "~/work/init_work.el"))
     (when (file-exists-p init_work)
           (load-file init_work)))
