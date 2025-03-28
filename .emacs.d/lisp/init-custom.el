;;; Pacakage -- init-custom
;;; Commentary:
;;; Code:

;;evil 配置
;;(require 'evil)
;;(evil-mode 1)
;;(setq evil-default-state 'emacs)

;; 扩展选择区域
(require 'expand-region)

;;搜索配置
(use-package avy
             :ensure t)
(use-package ace-jump-mode
             :ensure t)
(use-package marginalia
             :ensure t
             :init (marginalia-mode))
(use-package smartparens-config
             :ensure nil
             :config
             (smartparens-global-mode t))

(setq x-select-enable-clipboard t)
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'crux)

(recentf-mode t)
(setq-default make-backup-files nil)

(global-undo-tree-mode t)

(global-auto-revert-mode t)

(super-save-mode t)
(setq super-save-auto-save-when-idle t)
(setq make-backup-files nil)
(setq auto-save-default nil)

(use-package counsel
             :ensure t)

(use-package ivy
             :ensure t
             :init
             (ivy-mode t)
             (counsel-mode t)
             :config
             (setq ivy-use-virtual-buffers t)
             (setq enable-recursive-minibuffers t)
             )

(use-package which-key
             :ensure nil
             :defer t
             :hook (after-init . which-key-mode))

(use-package dashboard
             :ensure t
             :config
            (dashboard-setup-startup-hook)
            (setq dashboard-banner-logo-title "Cross Emacs")
            (setq dashboard-setup-startup-banner 'logo)

            (setq dashboard-items '((recents . 5)
                                    (bookmarks . 5)
                                    (projects . 5)
                                    (agenda . 5)))
)
;;(page-break-lines-mode)
(use-package projectile
             :ensure t
             :bind (("C-c p" . projectile-command-map))
             :config
             (setq projectile-mode-line "Projectile")
             (setq projectile-tracek-known-projcts-automatically nil))

(use-package counsel-projectile
             :ensure t
             :after (projectile)
             :init (counsel-projectile-mode))

(use-package neotree
             :ensure t
             )
(use-package dirvish
             :ensure t)

(provide 'init-custom)

;;; init-custom.el ends here
