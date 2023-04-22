;;; init.el --- rjd Emacs configuration

;;; Commentary:

;; Borrows from Mastering Emacs, Emacs Prelude

;;; License:

;;; Code:

					;(package-initialize)

(defvar root-dir (file-name-directory load-file-name)
  "The root of the Emacs configuration directory tree.")
(defvar lisp-dir (expand-file-name "lisp" root-dir)
  "Directory for custom Lisp that defines the configuration.")
(defvar bin-dir (expand-file-name "bin" root-dir)
  "Directory for executables & scripts used by emacs.")

;; Keep all automatically generated save & history files in one location
(defvar savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "Directory to store all the automatically generated save / history files.")
(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

;; setup load paths
(add-to-list 'load-path lisp-dir)
(add-to-list 'exec-path bin-dir)

;; reduce the frequency of garbage collection by making it happen on each
;; 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files larger than 100MB
(setq large-file-warning-threshold 100000000)

;; Load all elpa packages
(require 'packages)

;; Load my configuration
(require 'basic-ui)
(require 'modeline)

;; OS specific configurations should use a block that looks like this
(when (eq system-type 'gnu/linux)
  (require 'os-linux))
(when (and (eq system-type 'gnu/linux) (getenv "WSLENV"))
  (require 'os-wsl))
(when (eq system-type 'windows-nt)
  (require 'os-windows))

;; Configuration for individual major modes
(require 'mode-functions)

;; Broad families of modes
(require 'all-modes)
(require 'text-modes)
(require 'prog-modes)

;; Configuration for language specific major modes
(require 'lang-asciidoc)
(require 'lang-elisp)
(require 'lang-python)
(require 'lang-yaml)

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" root-dir))

(provide 'init)
;;; init.el ends here
