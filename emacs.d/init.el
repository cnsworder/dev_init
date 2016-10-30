;;; package --
;;; Commentary:
;;; file emacs
;;; author cnsworder, cnsworder@gmail.com


;;; Code:

;;{{VERSION}}

;; 插件载入路径
;;设置插件服务器

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;;; init.el ends here

(put 'upcase-region 'disabled nil)
