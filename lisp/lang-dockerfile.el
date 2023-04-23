;;; lang-dockerfile.el --- Editing dockerfiles

;;; Commentary:
;; https://github.com/spotify/dockerfile-mode

;;; License:

;;; Code:
(require 'dockerfile-mode)
(put 'dockerfile-image-name 'safe-local-variable #'stringp)
(setq dockerfile-mode-command "docker")

;; The dockerfile-langserver language server
;;     https://github.com/rcjsuen/dockerfile-language-server-nodejs
;;     https://www.npmjs.com/package/dockerfile-language-server-nodejs
;; The package is installed under node_modules with the following
;;     $ npm i dockerfile-language-server-nodejs
(add-hook 'dockerfile-mode-hook 'eglot-ensure)

(provide 'lang-dockerfile)
;;; lang-dockerfile.el ends here
