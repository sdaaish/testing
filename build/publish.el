;;; Publishes html-files from Org

;; Install straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Also install use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Install org-mode
(use-package org
  :straight org-contrib)

;; Install updated version of htmlize
(use-package htmlize)

;; No backups
(setq make-backup-files nil)

(require 'ox-publish)
(setq org-export-html-validation-link nil)
(setq org-html-inline-images t)
(setq org-html-head-include-scripts t)

;; Publish org-files
(setq org-publish-project-alist
      `(("testing"
         :base-directory "../"
         :base-extension "org"
         :publishing-directory "../"
         :publishing-function org-html-publish-to-html
         :recursive nil
         :html-link-home "/"
         :html-head-include-default-style nil
         :html-head-include-scripts t
         )))
(org-publish-project "testing")
(kill-emacs)

(provide 'publish)
;;; publish.el ends here
