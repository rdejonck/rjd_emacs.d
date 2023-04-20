;;; basic-ui.el --- Basic Emacs frame configuration

;;; Commentary:

;;; License:

;;; Code:

;; Do not display the initial splash screen
(setq inhibit-startup-screen t)

;; No toolbar
(tool-bar-mode -1)

;; No menu bar
;(menu-bar-mode -1)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'basic-ui)
;;; basic-ui.el ends here
