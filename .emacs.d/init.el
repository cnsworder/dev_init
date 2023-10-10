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

(setq custom-file (expand-file-name "lisp/custom.el" emacs-directory))
(load-file custom-file)

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
   '("d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" default))
 '(package-selected-packages
   '(zeal-at-point yasnippet-snippets xcscope which-key web-mode vue-mode vscode-icon undo-tree tern tabbar symbol-overlay super-save spaceline-all-the-icons smex smartparens shut-up rg request projectile prettier-js popwin package-build neotree mode-icons magit lua-mode lsp-ui lsp-jedi keycast js2-mode init-open-recentf indent-guide iedit highlight-parentheses gulp-task-runner gruvbox-theme google-c-style git-gutter git-gutter+ ggtags fzf flycheck-cask find-file-in-project fic-mode expand-region exec-path-from-shell emmet-mode elpy editorconfig dumb-jump dockerfile-mode docker-compose-mode dirvish direx direnv deferred dashboard dash-at-point crux counsel-osx-app counsel-gtags company-web company-ctags company-c-headers company-box cask-mode bm avy async ansi anaconda-mode all-the-icons-nerd-fonts all-the-icons-ivy all-the-icons-dired aggressive-indent ag add-node-modules-path ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
