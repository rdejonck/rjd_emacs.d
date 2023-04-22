;;; lang-yaml.el --- YAML support

;;; Commentary:

;;; License:

;;; Code:
(require 'yaml-mode)

;; TODO: Consider using indent-tools

;; Eglot/language server setup
;;
;; Redhat's yaml-language-server is available from
;;     https://github.com/redhat-developer/yaml-language-server
;;
;; The package is installed under node_modules with the following
;;     $ npm install yaml-language-server@1.10.0
(add-hook 'yaml-mode-hook 'eglot-ensure)

;; Install the ansible language server
;;     npm install @ansible/ansible-language-server@1.0.2
;; Also install Ansible Lint and YAML Lint
;;     $ pip3 install ansible-lint
;;     $ apt install yamllint
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       `((yaml-ts-mode yaml-mode)
		 . ,(eglot-alternatives '(("yaml-language-server" "--stdio")
					  ("ansible-language-server" "--stdio"))))))

;;(add-hook 'yaml-mode-hook 'whitespace-mode)
(add-hook 'yaml-mode-hook 'subword-mode)
(add-hook 'yaml-mode-hook
	  (lambda () (add-hook 'before-save-hook 'whitespace-cleanup nil t)))


;; Display indentation levels
(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-responsive 'stack)
(setq highlight-indent-guides-bitmap-function
      'highlight-indent-guides--bitmap-line)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)

(provide 'lang-yaml)
;;; lang-yaml.el ends here
