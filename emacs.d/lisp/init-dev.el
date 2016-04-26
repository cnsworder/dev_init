
;;开发相关配置
(require 'yasnippet)
(yas-global-mode)

(require 'git-gutter)
(global-git-gutter-mode t)
(git-gutter:linum-setup)

(cscope-minor-mode t)
(ggtags-mode t)
;;(ggtags-global-mode t)

(require 'flycheck)
(global-flycheck-mode t)

(require 'google-c-style)

(require 'flycheck-google-cpplint)
(flycheck-add-next-checker 'c/c++-clang
                           'c/c++-googlelint 'append)

;;(require 'company)
;;(require 'company-clang)
;;(require 'company-gtags)
;;(setq company-idle-delay t)
;;(company-mode t)
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9.2/")
(global-company-mode t)
(setq company-idle-delay 0.08)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-require-match nil)

;;(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends '(
                                 company-cmake
                                 company-keywords
                                 company-files
                                 company-gtags
                                 company-clang
                                 company-yasnippet
                                 company-c-headers
                                 company-abbrev
                                 company-eclim
                                 company-elisp
                                 company-dabbrev))
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

(setq auto-mode-alist
      (append
        '(("\\.html\\'" . web-mode)
          ("\\.js\\'" . js2-mode))))

(global-wakatime-mode)

(provide 'init-dev)
