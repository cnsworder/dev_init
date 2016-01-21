
;;开发相关配置
(require 'yasnippet)
(yas-global-mode)

(require 'git-gutter)
(global-git-gutter-mode t)
(git-gutter:linum-setup)

(cscope-minor-mode t)
(ggtags-mode 1)

(require 'flycheck)
(global-flycheck-mode t)

(require 'google-c-style)

(require 'flycheck-google-cpplint)
(flycheck-add-next-checker 'c/c++-clang
                           'c/c++-googlelint 'append)

(require 'company)
;;(require 'company-clang)
;;(require 'company-gtags)
;;(setq company-idle-delay t)
;;(company-mode t)
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9.2/")
(setq company-idle-delay 2)
(setq company-show-numbers t)
(setq company-require-match nil)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-clang)
(add-to-list 'company-backends 'company-gtags)
(global-set-key (kbd "C-c o") 'company-complete)

(elpy-enable)
(elpy-use-ipython)

;;(require 'cedet)
;;(load-file "/usr/share/emacs/24.3/lisp/cedet/cedet.elc")
;;(require 'ecb)
;;(require 'eassist)
;;(require 'auto-complete)

;;设置缩进
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-default-style "K&R")
(setq c-basic-offset 4)

(global-wakatime-mode)

(provide 'init-dev)
