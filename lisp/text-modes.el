;;; text-modes.el --- Configuration for all text modes

;;; Commentary:
;; Assumes that mode-functions.el has already been loaded

;;; License:

;;; Code:
(add-hook 'text-mode-hook 'enable-spell-check)
(add-hook 'text-mode-hook 'enable-whitespace-control)

(provide 'text-modes)
;;; text-modes.el ends here
