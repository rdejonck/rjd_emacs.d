;;; mode-functions.el --- Functions to dis-/en-able features per major mode

;;; Commentary:

;;; License:

;;; Code:

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

(provide 'mode-functions)
;;; mode-functions.el ends here
