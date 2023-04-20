;;; prog-modes.el --- Configuration for all programming modes

;;; Commentary:

;;; License:

;;; Code:
(add-hook 'prog-mode-hook 'enable-spell-check)
(add-hook 'prog-mode-hook 'flycheck-mode)

(provide 'prog-modes)
;;; prog-modes.el ends here
