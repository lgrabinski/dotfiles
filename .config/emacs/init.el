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

(use-package org
  :straight t
  :config
  (setq org-elipsis " ⬎")
  (setq org-hide-emphasis-markers t))

(require 'org)
(org-babel-load-file
  (expand-file-name "emacs_init.org"
                    user-emacs-directory))
