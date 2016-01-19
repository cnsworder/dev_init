;;; package -- 
;;; Commentary: 
;;; file emacs
;;; author cnsworder, cnsworder@gmail.com


;;; Code:

;;{{VERSION}}

;; 插件载入路径
;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "."))

;;设置插件服务器
(require 'init-package)

(require 'init-env)
(require 'init-helm')
(require 'init-dev)
(require 'init-hook)
(require 'key-set)
(require 'init-theme)
(require 'init-custom)

;;; init.el ends here
