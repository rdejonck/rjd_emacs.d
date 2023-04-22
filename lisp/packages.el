;;; packages.el --- Setup package repositories and packages to load

;;; Commentary:

;;; License:

;;; Code:
(require 'cl-lib)
(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(setq package-user-dir (expand-file-name "elpa" root-dir))
(package-initialize)

(defvar my-packages
  '(adoc-mode
    eglot
    flycheck
    magit
    minimap
    tree-sitter
    tree-sitter-langs
    typescript-mode
    yaml-mode)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  "Check if all packages in `my-packages' are installed."
  (cl-every #'package-installed-p my-packages))

(defun my-require-package (package)
  "Install PACKAGE unless it is already installed."
  (unless (memq package my-packages)
    (add-to-list 'my-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun my-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'my-require-package packages))

(defun my-install-packages ()
  "Install all packages listed in `my-packages'."
  (unless (my-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing the package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (my-require-packages my-packages)))

;; run package installation
(my-install-packages)

(provide 'packages)
;;; packages.el
