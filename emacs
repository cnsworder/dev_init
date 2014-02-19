(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-rpo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(if (not (package-installed-p `markdown-mode))
    (package-install `markdown-mode))
(if (not (package-installed-p `company))
    (package-install `company))
(if (not (package-installed-p `markdown-mode))
    (package-install `markdown-mode))
(if (not (package-installed-p `sr-speedbar))
    (package-install `sr-speedbar))
(if (not (package-installed-p `molokai))
    (package-install `molokai))
(if (not (package-installed-p `tabbar))
    (package-install `tabbar))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "/home/cnsworder/.emacs.d/elpa/company-0.6.12/")
(require `tabbar)
(tabbar-mode t)
(autoload 'company-mode "company" nil t)
(load-file "/usr/share/emacs/24.3/lisp/cedet/cedet.elc")
(require 'ecb)
;;(require 'auto-complete)
(require 'company nil t)
(require 'company-clang)
(require 'sr-speedbar)
(setq company-idle-delay t)
(company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (molokai)))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/"))))
 '(ede-project-directories (quote ("/home/cnsworder/workspace/haoop" "/home/cnsworder/workspace" "/home/cnsworder"))))
(set-default-font "WenQuanYi Micro Hei")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-cursor-color "White")
