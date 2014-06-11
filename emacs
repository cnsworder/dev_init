;;设置插件服务器
;;(package-menu-mark-upgrades)
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rpo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;;查找我用的包有没有安装
(if (not (package-installed-p 'markdown-mode))
    (package-install 'markdown-mode))
(if (not (package-installed-p 'company))
    (package-install 'company))
(if (not (package-installed-p 'markdown-mode))
    (package-install 'markdown-mode))
(if (not (package-installed-p 'sr-speedbar))
    (package-install 'sr-speedbar))
(if (not (package-installed-p 'molokai-theme))
    (package-install 'molokai-theme))
(if (not (package-installed-p 'tabbar))
    (package-install 'tabbar))
(if (not (package-installed-p 'zeal-at-point))
    (package-install 'zeal-at-point))
(if (not (package-installed-p 'evil))
    (package-install 'evil))
(if (not (package-installed-p 'smex))
    (package-install 'smex))
(if (not (package-installed-p 'anaconda-mode))
    (package-install 'anaconda-mode))

;; 插件载入路径
(add-to-list 'load-path "/home/cnsworder/.emacs.d/elpa/company-0.6.12/")

;;插件的设置
(require `tabbar)
(tabbar-mode t)
(autoload 'company-mode "company" nil t)
(load-file "/usr/share/emacs/24.3/lisp/cedet/cedet.elc")
(require 'ecb)
(require 'sr-speedbar)
(require 'eassist)
;;(require 'auto-complete)

(require 'company nil t)
(require 'company-clang)
(setq company-idle-delay t)
(company-mode)

(global-set-key  (kbd "C-c d") 'zeal-at-point)

(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)

;; 设置样式
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes (quote ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" default)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/"))))
 '(ede-project-directories (quote ("/home/cnsworder/workspace/haoop" "/home/cnsworder/workspace" "/home/cnsworder"))))

(set-default-font "文泉驿等宽正黑" 12)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(setq cjk-font "文泉驿等宽正黑")

;;暗色主题下光标颜色设置一下
(set-cursor-color "White")

;;去掉工具栏
(if window-system
   (tool-bar-mode 0))

;;不同模式下的是指
(add-hook  'markdown-mode-hook 
    (lambda ( )
      (global-set-key (kbd "C-c p") 'markdown-preview)))
(add-hook 'c-mode-hook
    (lambda ()
    ¦   (c-set-style "K&R")))
(add-hook 'python-mode-hook
    'anaconda-mode)

;;设置缩进
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

;;避免输入法切换冲突
(global-unset-key (kbd "C-SPC"))
