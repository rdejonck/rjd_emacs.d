;;; lang-shell_script.el --- Editing all flavors of shell scripts

;;; Code:

;; make a shell script executable automatically on save
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

(provide 'lang-shell_script)
;;; lang-shell_script.el ends here
