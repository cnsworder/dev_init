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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq byte-compile-warnings '(cl-functions))
(setq warning-suppress-log-types '((package reinitialization)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-jump-mode aggressive-indent auto-package-update avy company-box
                   counsel-projectile crux dashboard direnv dirvish
                   dumb-jump ef-themes emmet-mode exec-path-from-shell
                   expand-region fic-mode flycheck format-all ggtags
                   highlight-parentheses indent-guide js2-mode lsp-ivy
                   lsp-ui marginalia neotree popwin queue smartparens
                   spaceline-all-the-icons super-save vue-mode vundo
                   web-mode xcscope yasnippet-snippets)))
