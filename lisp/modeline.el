;;; modeline.el --- Configures elements of the Emacs modeline

;;; Commentary:

;;; License:

;;; Code:
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

(minions-mode)

(provide 'modeline)
;;; modeline.el ends here
