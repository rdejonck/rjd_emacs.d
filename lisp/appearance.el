;;; appearance.el --- Visual elements of the editor

;;; Commentary:

;;; License:

;;; Code:

;; Do not display the initial splash screen
(setq inhibit-startup-screen t)

;; Scrolling setup
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; No toolbar
(tool-bar-mode -1)

;; No menu bar
;(menu-bar-mode -1)

;; Control the frame width so there is room for 80 characters and the minimap
(add-to-list 'initial-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(width . 100))

;; Default to displaying line numbers on the left of the buffer
(global-display-line-numbers-mode)

;; Show either the filename or the buffer name in the title bar
(setq frame-title-format '("" invocation-name ": " "%b"))

;; hilight the current line
(global-hl-line-mode +1)

;; Theme control
(require 'zenburn-theme)
(setq zenburn-override-colors-alist
      '(("zenburn-green" . "#9fc59f")))


;; Use scaled headings for some headings and titles
(setq zenburn-use-variable-pitch t)
(setq zenburn-scale-org-headlines t)
(setq zenburn-scale-outline-headlines t)

(load-theme 'zenburn t)

(provide 'appearance)
;;; appearance.el ends here
