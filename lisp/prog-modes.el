;; prog-modes.el --- Configuration for all programming modes

;;; Commentary:

;;; License:

;;; Code:

(add-hook 'prog-mode-hook 'enable-spell-check)
;(add-hook 'prog-mode-hook 'enable-whitespace-control)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Prefer tree-sitter over font-lock-mode for syntax hilighting
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Configure the minimap
(setq minimap-window-location 'right)
(setq minimap-minimum-width 10)
(setq minimap-dedicated-window t)
(setq minimap-hide-cursor t)
(setq minimap-hide-scroll-bar t)
(setq minimap-hide-fringes t)
(setq minimap-width-fraction 0.10)
(minimap-mode 1)

;; Display indentation levels
(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-responsive 'stack)
(setq highlight-indent-guides-bitmap-function
      'highlight-indent-guides--bitmap-line)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Stylize annotations like TODO in sourcecode
(require 'hl-todo)
(global-hl-todo-mode 1)


(provide 'prog-modes)
;;; prog-modes.el ends here
