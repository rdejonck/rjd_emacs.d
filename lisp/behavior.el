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

;; saveplace remembers your location in a file when saving files
(setq save-place-file (expand-file-name "saveplace" saves-dir))
(save-place-mode 1)

;; savehist keeps track of some edit history
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the history with other backups
      savehist-file (expand-file-name "savehist" saves-dir))
(savehist-mode +1)

;; save recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" saves-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15
      ;; disable recentf-cleanup on Emacs start because it can cause problems
      ;; with remote files (according to Bozhidar Batsov)
      recentf-auto-cleanup 'never)
(recentf-mode +1)

;; bookmarks
(require 'bookmark)
(setq bookmark-default-file (expand-file-name "bookmarks" saves-dir)
      bookmark-save-flag 1)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; Make meaningful unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;;(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified buffers
(setq uniquify-ignore-biffers-re "^\\*") ; Do not uniquify special buffers

(require 'yasnippet)
(yas-global-mode 1)

(setq company-tooltip-align-annotations t)
(setq company-tooltip-flip-when-above t)
(setq company-format-margin-function #'company-vscode-dark-icons-margin)
(add-hook 'after-init-hook 'global-company-mode)

;; Use Ivy / Counsel / Swiper for better completion/search
;; From https://github.com/abo-abo/swiper
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(require 'swiper)
;; enable this if you want `swiper' to use it
;;(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)

(require 'counsel)
;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;(global-set-key (kbd "<f6>") 'ivy-resume)
;(global-set-key (kbd "M-x") 'counsel-M-x)
;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;(global-set-key (kbd "C-c g") 'counsel-git)
;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;(global-set-key (kbd "C-c k") 'counsel-ag)
;(global-set-key (kbd "C-x l") 'counsel-locate)
;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(provide 'behavior)
;;; behavior.el ends here
