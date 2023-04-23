;;; lang-markdown.el --- Editing markdowns

;;; Commentary:
;;    https://jblevins.org/projects/markdown-mode/

;;; License:

;;; Code:
(require 'markdown-mode)

;; Using Marksman for the language server
;;     https://github.com/artempyanykh/marksman
;; Using the prebuilt binaries and storing them under .emacs.d/bin
;;
;; There is a markdown language server used in VsCode that is available from
;; Microsoft. I am not using it because it claims it has not been tested with
;; clients other than VsCode and it probably depends on Node 14+
;;     https://code.visualstudio.com/blogs/2022/08/16/markdown-language-server
;;     https://github.com/microsoft/vscode/tree/main/extensions/markdown-language-features/server

;; TODO construct the program name using system-type so it works on other platforms
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(markdown-mode . ("marksman-linux"))))
(add-hook 'markdown-mode-hook 'eglot-ensure)

(provide 'lang-markdown)
;;; lang-markdown.el ends here
