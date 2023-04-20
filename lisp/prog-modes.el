;;; prog-modes.el --- Configuration for all programming modes

;;; Commentary:

;;; License:

;;; Code:

(add-hook 'prog-mode-hook 'enable-spell-check)
(add-hook 'prog-mode-hook 'flycheck-mode)

;; Prefer tree-sitter over font-lock-mode for syntax hilighting
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'prog-modes)
;;; prog-modes.el ends here
