;;; package --
;;; Commentary:
;;; file emacs
;;; author cnsworder, cnsworder@gmail.com

;;; Code:

;;{{VERSION}}

;;设置插件管理工具

(require 'package)
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/")
                         ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")
 			             ("org-cn" . "http://elpa.emacs-china.org/org/")
 			             ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rpo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
(add-to-list 'package-archives '("orgmode" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; (setq package-enable-at-startup nil)

(provide 'init-package)
