;;; lang-python.el --- Configuration for python programming

;;; Commentary:

;;; License:

;;; Code:

;; Enable python-lsp-server and eglot for Python modes
;; NOTE: You need to install pylsp (python-lsp-server) or another python
;; lsp for this to work.
;;     $ pip install "python-lsp-server[all]
(add-hook 'python-mode-hook 'eglot-ensure)

(provide 'lang-python)
;;; lang-python.el ends here
