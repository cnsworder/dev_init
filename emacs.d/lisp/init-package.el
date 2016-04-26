;;; package -- 
;;; Commentary: 
;;; file emacs
;;; author cnsworder, cnsworder@gmail.com


;;; Code:

;;{{VERSION}}

;;设置插件服务器
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rpo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("orgmode" . "http://orgmode.org/elpa/"))
(package-initialize)

(require 'cl-lib)

(defvar *install-packages* '(
                             tabvar
                             popwin
                             dracula-theme
                             )
  "Default package")

(defun cross/packages-installed-p ()

  (loop for pkg in *install-packages*
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

;;(unless (cross/packages-installed-p)
;;  (message "%s" "Refreshing package database...")
;;  (package-refresh-contents)
;;  (dolist (pkg *install-packages*)
;;    (when (not (package-installed-p pkg))
;;      (package-install pkg))))

;;(mapc #'(lambda (package) 
;;          (unless (package-install-p package)
;;           (package-install package))
;;          *install-packages*))

(defun install-custom-package ()

    "安装插件"
    (interactive)

    (package-list-packages)
    ;;(package-menu-mark-upgrades)

    ;;查找我用的包有没有安装

    ;;molokai 配色
    (package-install 'molokai-theme)
    (package-install 'dracula-theme)
    ;;文件列表
    (package-install 'sr-speedbar)
    ;;标签页
    ;;(package-install 'tabbar)
    ;;自动保存
    (package-install 'super-save)
    ;;窗口操作
    (package-install 'popwin)
    ;;打开当前文件目录
    (package-install 'direx)
    ;;undo
    (package-install 'undo-tree)
    
    ;;快速操作    
    (package-install 'helm)
    (package-install 'swiper)
    (package-install 'counsel)
    (package-install 'ecb)
    (package-install 'smex)
    ;;vim 模式
    ;;(package-install 'evil)

    ;;代码片段补全
    (package-install 'yasnippet)
    ;;智能提示
    (package-install 'company)
    (package-install 'company-c-headers)
    ;;代码帮助
    (if (eq system-type 'darwin)
      (package-install 'dash-at-point)
      (package-install 'zeal-at-point))
    ;;代码跳转
    (package-install 'xcscope)
    (package-install 'ggtags)
    ;;代码检查
    (package-install 'flycheck)
    (package-install 'flycheck-google-cpplint)
    ;;google c style
    (package-install 'google-c-style)
    ;;git
    (package-install 'magit)
    (package-install 'git-gutter)
    ;;自动添加匹配括号
    (package-install 'smartparens)
    ;;高亮括号
    (package-install 'highlight-parentheses)

    ;;搜索
    (package-install 'avy)
    (package-install 'ace-jump-mode)

    ;;python
    (package-install 'anaconda-mode)
    (package-install 'elpy)
    ;;markdown
    (package-install 'markdown-mode)
    ;;web
    (package-install 'web-mode)
    ;;js
    (package-install 'js2-mode)

    ;;多光标
    (package-install 'iedit)
    
    ;;中文输入法
    ;;(package-install 'chinese-pyim)

    ;;彩虹猫
    ;;(package-install 'nyan-mode)
    
    (kill-emacs)
)

(provide 'init-package)
