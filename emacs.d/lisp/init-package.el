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
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

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
    (package-install 'dracula-theme)
    ;; 文件列表
    (package-install 'neotree)
    ;; 自动保存
    (package-install 'super-save)
    ;; 窗口操作
    (package-install 'popwin)
    ;; 窗口跳转
    (package-install 'window-numbering)
    ;; 目录增强
    (package-install 'dired+)
    ;; 打开当前文件目录
    (package-install 'direx)
    ;; undo
    (package-install 'undo-tree)
    ;; editorconfig
    (package-install 'editorconfig)
    ;; exec form path
    (package-install 'exec-path-from-shell)

    ;;快速操作
    (package-install 'swiper)
    (package-install 'counsel)
    (if (eq system-type 'darwin)
        (package-install 'counsel-osx-app))
    ;; 按键提示
    (package-install 'which-key)

    ;; 代码片段补全
    (package-install 'yasnippet)
    ;; 智能提示
    (package-install 'company)
    (package-install 'company-web)

    ;;代码跳转
    (package-install 'ggtags)
    ;;代码检查
    (package-install 'flycheck)
    ;;git
    (package-install 'magit)
    (package-install 'git-gutter)

    ;; 自动添加匹配括号
    (package-install 'smartparens)
    ;; 高亮括号
    (package-install 'highlight-parentheses)
    ;; 缩进线
    (package-install 'indent-guide)
    ;; 扩展选择区域
    (package-install 'expand-region)

    ;;搜索
    (package-install 'avy)
    (package-install 'ag)
    (package-install 'ace-jump-mode)

    ;;web
    (package-install 'web-mode)
    (package-install 'emmet-mode)
    ;;js
    (package-install 'js2-mode)

    ;;多光标
    (package-install 'iedit)

    (kill-emacs)
)

(provide 'init-package)
