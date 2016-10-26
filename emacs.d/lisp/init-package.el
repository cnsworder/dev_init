;;; package --
;;; Commentary:
;;; file emacs
;;; author cnsworder, cnsworder@gmail.com

;;; Code:

;;{{VERSION}}

;;设置插件服务器
(require 'package)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-rpo.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;(add-to-list 'package-archives '("orgmode" . "http://orgmode.org/elpa/"))
(setq package-archives
      '(("gnu-cn" . "http://elpa.codefalling.com/gnu/")
        ("org-cn" . "http://elpa.codefalling.com/org/")
        ("melpa-cn" . "http://elpa.codefalling.com/melpa/")))
;;(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(require 'cl-lib)

(defvar *install-packages* '(
                             tabvar
                             popwin
                             dracula-theme
                             company
                             company-ycmd
                             which-key
                             editorconfig
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

    ;; molokai 配色
    (package-install 'molokai-theme)
    (package-install 'dracula-theme)
    ;; powerline
    ;; (package-install 'spaceline)
    ;; 图标
    (package-install 'all-the-icons)
    (package-install 'mode-icons)
    ;; 首页
    (package-install 'init-open-recentf)
    ;; 高亮当前行和列
    (package-install 'crosshairs)
    ;; 文件列表
    (package-install 'neotree)
    ;; 标签页
    ;;(package-install 'tabbar)
    ;; 自动保存
    (package-install 'super-save)
    ;; 窗口操作
    (package-install 'popwin)
    ;; 窗口跳转
    (package-install 'window-numbering)
    ;; bookmarks
    (package-install 'bm)
    ;; 目录增强
    (package-install 'dired+)
    ;; 打开当前文件目录
    (package-install 'direx)
    ;; 打开外部应用
    (package-install 'crux)
    ;; undo
    (package-install 'undo-tree)
    ;; editorconfig
    (package-install 'editorconfig)
    ;; exec form path
    (package-install 'exec-path-from-shell)

    ;;快速操作
    ;;(package-install 'helm)
    (package-install 'swiper)
    (package-install 'counsel)
    (if (eq system-type 'darwin)
        (package-install 'counsel-osx-app))
    ;;(package-install 'ecb)
    ;;(package-install 'smex)
    ;; vim 模式
    ;;(package-install 'evil)
    ;; 按键提示
    (package-install 'which-key)

    ;; 代码片段补全
    (package-install 'yasnippet)
    ;; 智能提示
    (package-install 'company)
    (package-install 'company-ycmd)
    (package-install 'company-web)
    (package-install 'company-c-headers)

    ;; 代码帮助
    (if (eq system-type 'darwin)
        (package-install 'dash-at-point)
        (package-install 'zeal-at-point))
    ;;代码跳转
    (package-install 'xcscope)
    (package-install 'ggtags)
    ;;代码检查
    (package-install 'flycheck)
    (package-install 'flycheck-ycmd)
    (package-install 'flycheck-google-cpplint)
    ;;google c style
    (package-install 'google-c-style)
    ;;git
    (package-install 'magit)
    (package-install 'git-gutter)

    ;; 自动添加匹配括号
    (package-install 'smartparens)
    ;; 高亮括号
    (package-install 'highlight-parentheses)
    ;; 缩进线
    (package-install 'indent-guide)
    ;; 缩进对齐
    (package-install 'aggressive-indent)
    ;; 扩展选择区域
    (package-install 'expand-region)

    ;;搜索
    (package-install 'avy)
    (package-install 'ag)
    (package-install 'ace-jump-mode)
    ;;(package-install 'helm-ag)

    ;;python
    (package-install 'anaconda-mode)
    (package-install 'elpy)
    ;;markdown
    (package-install 'markdown-mode)
    ;;web
    (package-install 'web-mode)
    (package-install 'emmet-mode)
    ;;js
    (package-install 'js2-mode)
    ;;go
    (package-install 'go-mode)
    (package-install 'company-go)

    ;;多光标
    (package-install 'iedit)

    ;;中文输入法
    ;;(package-install 'chinese-pyim)

    ;;彩虹猫
    ;;(package-install 'nyan-mode)

    (kill-emacs)
    )

(provide 'init-package)
