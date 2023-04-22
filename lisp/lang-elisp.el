;;; lang-elisp.el --- Configuration for Emacs Lisp programming

;;; Commentary:

;;; License:

;;; Code:

(defun conditionally-enable-smartparens-mode ()
  "Enable `smartparens-mode' in the minibuffer, during `eval-expression'."
  (if (eq this-command 'eval-expression)
      (smartparens-mode 1)))
(add-hook 'minibuffer-setup-hook 'conditionally-enable-smartparens-mode)

(defun elisp-coding-defaults ()
  (smartparens-mode +1)
  (rainbow-delimiters-mode +1)
  (eldoc-mode +1)
  (rainbow-mode +1)
  (setq mode-name "EL"))
(add-hook 'emacs-lisp-mode-hook 'elisp-coding-defaults)

(provide 'lang-elisp)
;;; lang-elisp.el ends here
