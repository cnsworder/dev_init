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
   '(ace-jump-mode add-node-modules-path ag aggressive-indent
                   all-the-icons-dired all-the-icons-ivy anaconda-mode
                   ansi async bm cask-mode company-box
                   company-c-headers company-ctags company-web
                   consult-eglot counsel-gtags counsel-osx-app
                   counsel-projectile crux dash-at-point dashboard
                   deferred direnv direx dirvish docker-compose-mode
                   dockerfile-mode dumb-jump ef-themes elpy emmet-mode
                   exec-path-from-shell expand-region fic-mode
                   find-file-in-project flycheck-cask format-all fzf
                   ggtags git-gutter google-c-style gruvbox-theme
                   gulp-task-runner highlight-parentheses iedit
                   indent-guide init-open-recentf js2-mode keycast
                   lsp-ivy lsp-jedi lsp-ui lua-mode magit marginalia
                   mode-icons neotree package-build pkg-info popwin
                   prettier-js request rg shut-up smartparens smex
                   spaceline-all-the-icons super-save symbol-overlay
                   tabbar tern treemacs undo-tree vscode-icon vue-mode
                   web-mode xcscope yasnippet-snippets zeal-at-point)))
