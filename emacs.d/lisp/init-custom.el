
;;evil 配置
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs)

;;搜索配置
(require 'avy)
(require 'ace-jump-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(setq x-select-enable-clipboard t)
(defalias 'yes-or-no-p 'y-or-n-p)

(ivy-mode t)
(setq ivy-use-virtual-buffers t)

(recentf-mode t)
(setq-default make-backup-files nil)

(global-auto-revert-mode t)

(super-save-mode t)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)

(provide 'init-custom)
