;;; file emacs
;;; author cnsworder, cnsworder@gmail.com

;;{{VERSION}}

;;设置插件服务器
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rpo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("orgmode" . "http://orgmode.org/elpa/"))
(package-initialize)

(defun cn-set-package ()
    "安装插件"
    (interactive)
    ;;(package-menu-mark-upgrades)

    ;;查找我用的包有没有安装

    ;;molokai 配色
    (package-install 'molokai-theme)
    ;;文件列表
    (package-install 'sr-speedbar)
    ;;标签页
    (package-install 'tabbar)

    ;;快速操作    
    (package-install 'helm)
    (package-install 'ecb)
    (package-install 'smex)
    ;;vim 模式
    (package-install 'evil)

    ;;代码片段补全
    (package-install 'yasnippet)
    ;;智能提示
    (package-install 'company)
    (package-install 'company-c-headers)
    ;;代码帮助
    (package-install 'zeal-at-point)
    ;;代码跳转
    (package-install 'xcscope)
    (package-install 'ggtags)
    ;;代码检查
    (package-install 'flycheck)
    (package-install 'flycheck-google-cpplint)
    ;;google c style
    (package-install 'google-c-style)
    ;;git
    (package-install 'git-gutter)
    ;;自动添加匹配括号
    (package-install 'smartparens)
    ;;高亮括号
    (package-install 'highlight-parentheses)

    ;;python
    (package-install 'anaconda-mode)
    ;;markdown
    (package-install 'markdown-mode)
    
    ;;中文输入法
    (package-install 'chinese-pyim)
    
    (kill-emacs))
;;(cn-set-package)

;; 插件载入路径
;;(add-to-list 'load-path "~/.emacs.d/elpa/company-20040824.95/")

;;插件的设置
(require 'tabbar)
(setq tabbar-buffer-groups-function nil)
(tabbar-mode t)

;;(require 'sr-speedbar)
;;(setq speedbar-show-unknown-files t)
;;(setq speedbar-use-images nil)


;;evil 配置
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs)

;;helm配置
(require 'helm-config)
(helm-mode 1)
(setq helm-quick-update t)
(setq helm-M-x-requires-pattern nil)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; helm 替换smex和ido
;;(require 'smex)
;;(global-set-key (kbd "M-x") 'smex)
;;(require 'ido)
;;(ido-mode t)

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
(setq company-idle-delay nil)
(setq company-show-numbers t)
(setq company-require-match nil)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-clang)
(add-to-list 'company-backends 'company-gtags)
(global-set-key (kbd "C-c o") 'company-complete)

(require 'smartparens-config)
(smartparens-global-mode t)

(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)

(global-hl-line-mode t)

;;(require 'cedet)
;;(load-file "/usr/share/emacs/24.3/lisp/cedet/cedet.elc")
;;(require 'ecb)
;;(require 'eassist)
;;(require 'auto-complete)

(require 'chinese-pyim)
(setq default-input-method "chinese-pyim")

;; 设置样式
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/4.9.2/")))
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" default)))
 '(ede-project-directories
   (quote
    ("/home/cnsworder/workspace/haoop" "/home/cnsworder/workspace" "/home/cnsworder")))
 '(pyim-dicts
   (quote
    ((:name "py" :file "/home/cnsworder/.emacs.d/pyim-bigdict.txt" :coding utf-8-unix)))))

  (set-default-font "文泉驿等宽正黑-10")

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
;;(add-hook  'markdown-mode-hook 
;;    (lambda ()
;;      (global-set-key (kbd "C-c p") 'markdown-preview)))

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'python-mode-hook
          'anaconda-mode)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

;;设置缩进
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq c-default-style "K&R")

(global-linum-mode)


(defun cn-set-key () 
   "设置快捷键"
   
   (interactive)

   ;;避免输入法切换冲突
   (global-unset-key (kbd "C-SPC"))
   
   ;;快捷键设置
   (global-set-key (kbd "<f3>") 'sr-speedbar-toggle)
   (global-set-key (kbd "<f4>") 'eshell)
   ;;(global-set-key (kbd "<f5>") '(shell-command '"astyle --style=kr"))
   (global-set-key (kbd "<f2>") 'revert-buffer)
   (global-set-key (kbd "<f6>") 'linum-mode)
   (global-set-key (kbd "<f7>") 'whitespace-mode)
   (global-set-key (kbd "C-c d") 'zeal-at-point)
   (global-set-key (kbd "C-c b") 'refill-mode))
   (global-set-key (kbd "C-c c") 'c++-mode)
   
;;自定义配置
(cn-set-key)
(setq inhibit-startup-message t)
;;(setq x-select-enable-clipboard t)
(defalias 'yes-or-no-p 'y-or-n-p)
