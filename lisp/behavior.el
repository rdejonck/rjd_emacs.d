;;; behavior.el --- Manage how the editor functions

;;; Commentary:
;; Functions to dis-/en-able features per major mode

;;; License:

;;; Code:

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; For spell-checking while you type
(require 'flyspell)
(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra")
      ispell-list-command "--list"
      flyspell-issue-message-flag nil)
(defun enable-spell-check ()
  "Enable `flyspell-mode'"
  (interactive)
  (if (not (symbol-value flyspell-mode)) ; if not already on
      (progn
	(if (derived-mode-p 'prog-mode)
	    (progn
	      (message "Flyspell on (code)")
	      (flyspell-prog-mode))
	  ;; else
	  (progn
	    (message "Flyspell on (text)")
	    (flyspell-mode 1)))
	)))
(defun flyspell-toggle ()
  "Turn Flyspell on if it is off, or off if it is on. When turning on, it uses `enable-spell-check' so code-vs-text is handled appropriately."
  (interactive)
  (if (symbol-value flyspell-mode)
      (progn ; flyspell is on, turn it off
	(message "Flyspell off")
	(flyspell-mode -1))
    ;; else - flyspell is off, turn it on
      (enable-spell-checking)))
    
;; Cleanup extra whitespace
(defun enable-whitespace-control ()
  "Enable `whitespace-mode'"
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (whitespace-mode +1))

;; Consolidate backup and auto-save files
(setq backup-directory-alist `(("" . ,saves-dir)))
(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 0
      version-control t)
;; Automatically update the saved file rather than creating '#...' autosave files
(auto-save-visited-mode 1)


(require 'yasnippet)
(yas-global-mode 1)

(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-format-margin-function #'company-vscode-dark-icons-margin)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'behavior)
;;; behavior.el ends here
