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

;; Default to displaying line numbers on the left of the buffer
(global-display-line-numbers-mode)

;; Show either the filename or the buffer name in the title bar
(setq frame-title-format
      '("" invocation-name ": "
	(:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 %b))))

;; hilight the current line
(global-hl-line-mode +1)

;; Theme control
;;(setq zenburn-override-colors-alist
;;      '(("zenburn-green" . "#9fc59f")))


;; Use scaled headings for some headings and titles
(setq zenburn-use-variable-pitch t)
(setq zenburn-scale-org-headlines t)
(setq zenburn-scale-outline-headlines t)

(load-theme 'zenburn t)

(provide 'basic-ui)
;;; basic-ui.el ends here
