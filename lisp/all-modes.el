;;; all-modes.el --- Features common to all major modes

;;; Code:
(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-format-margin-function #'company-vscode-dark-icons-margin)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'all-modes)
;;; all-modes.el ends here
