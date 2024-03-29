
(setq package-enable-at-startup nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(use-package evil
    :straight t
    :init
    (setq evil-want-C-i-jump nil)
    :config
    (evil-mode 1))

(use-package evil-commentary
  :straight t)

(use-package vertico
    :straight t
    :init
    (vertico-mode)
    :bind (:map vertico-map
        ("C-j" . vertico-next)
        ("C-k" . vertico-previous)
        ("C-f" . vertico-exit)))

(use-package marginalia
    :init
    (marginalia-mode))

(use-package corfu
    :straight t
    :custom
    (corfu-auto t)
    :init
    (global-corfu-mode))

(use-package doom-modeline
    :straight t
    :hook (after-init . doom-modeline-mode))


(use-package all-the-icons
    :straight t)

(use-package doom-themes
    :straight t
    :config
    (setq doom-themes-enable-bold nil
          doom-themes-enable-italic t)
    (load-theme 'doom-one t))

;; font face base on platform type
(pcase system-type
  ((or 'gnu/linux 'cygwin)
   (set-face-attribute 'default nil :font "Fira Code Retina" :height 85))
   ;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 60 :weight 'bold))
  ('windows-nt 
   (set-face-attribute 'default nil :font "Fira Code Retina" :height 100)))

(use-package nerd-icons
    :straight t)
