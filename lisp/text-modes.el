;;; text-modes.el --- Configuration for all text modes

;;; Commentary:
;; Assumes that mode-functions.el has already been loaded

;;; License:

;;; Code:
(defun text-fill-setup ()
  (set-fill-column 72)
  (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
  (turn-on-visual-line-mode))
(add-hook 'text-mode-hook 'enable-spell-check)
(add-hook 'text-mode-hook 'text-fill-setup)

(provide 'text-modes)
;;; text-modes.el ends here
