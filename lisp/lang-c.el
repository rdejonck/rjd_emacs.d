;;; lang-c.el --- Configuration for C/C++ modes -*- lexical-binding: t -*-
;;; Commentary:
;;
;; Use clangd for a language server. Install it with:
;;     $ sudo apt install clangd

;;; Code:

;; Auto-detect others' files indent style
;; Use spaces by default, but check existing files and adapt if they already
;; use tabs.  Consider using the guess-style in the future
;; (https://nschum.de/src/emacs/guess-style/)
;; There is probably a good way to use `c-guess'
(defun rjd-infer-indentation-style ()
  ;; use tabs if the source file uses tabs
  ;; use spaces if the source file uses spaces
  ;; use the current indent-tabs-mode if neither is used
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(defun rjd-c-mode-common-defaults ()
      (setq c-default-style "bsd"
	    c-basic-offset 4)
      (setq-local indent-tabs-mode nil)
      (rjd-infer-indentation-style))

(add-hook 'c-mode-common-hook 'rjd-c-mode-common-defaults)

(provide 'lang-c)
;;; lang-c.el ends here
