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

(setq emacs-directory "~/.emacs.d/")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)

;;(setq custom-file (expand-file-name "lisp/custom.el" emacs-directory))
;;(load-file custom-file)

;;; init.el ends here

(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruvbox-dark-hard))
 '(custom-safe-themes
   '("8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
     "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
