
;;; Code

(defun key-set ()
    "设置快捷键"

    (interactive)

    ;; meta键调整
    (if (eq system-type 'darwin)
        (progn
            (setq mac-command-modifier 'alt)
            (setq mac-control-modifier 'control)
            (setq mac-option-modifier 'meta)))

    ;;避免输入法切换冲突
    (global-unset-key (kbd "C-SPC"))

    ;;快捷键设置
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)

    (global-set-key (kbd "C-s") 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "C-c C-i") 'counsel-imenu)
    (global-set-key (kbd "C-c C-g") 'counsel-git)
    (global-set-key (kbd "C-c C-a") 'counsel-ag)
    (global-set-key (kbd "C-c C-e") 'hippie-expand)
    (global-set-key (kbd "C-c C-b") 'counsel-bookmark)

    (global-set-key (kbd "C-c C-m") 'bookmark-set)
    (global-set-key (kbd "C-c C-v") 'er/expand-region)

    (global-set-key (kbd "C-h v") 'counsel-describe-variable)
    (global-set-key (kbd "C-h f") 'counsel-describe-function)

    (global-set-key (kbd "C-c m m") 'bm-toggle)
    (global-set-key (kbd "C-c m l") 'bm-show-all)
    (global-set-key (kbd "C-c m n") 'bm-next)
    (global-set-key (kbd "C-c m p") 'bm-previous)

    (global-set-key (kbd "C-c o") 'crux-open-with)

    ;; 代码补全
    (global-set-key (kbd "C-c C-y") 'company-mode)
    (global-set-key (kbd "C-c C-o") 'company-complete)

    ;; git 相关
    (global-set-key (kbd "C-c g c") 'magit-commit)
    (global-set-key (kbd "C-c g p") 'magit-push)
    (global-set-key (kbd "C-c g f") 'magit-pull)
    (global-set-key (kbd "C-c g s") 'magit-status)
    (global-set-key (kbd "C-c g d") 'magit-diff)
    (global-set-key (kbd "C-c g o") 'magit-checkout)
    (global-set-key (kbd "C-c g b") 'magit-branch)
    (global-set-key (kbd "C-c g l") 'magit-log-all)
    (global-set-key (kbd "C-c g m") 'magit-merge)
    (global-set-key (kbd "C-c g r") 'magit-rebase)
    (global-set-key (kbd "C-c g v") 'magit-revert)
    (global-set-key (kbd "C-c g e") 'magit-rebase)

    ;; projectile
    (global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)
    (global-set-key (kbd "C-c p a") 'projectile-ag)
    (global-set-key (kbd "C-c p p") 'projectile-switch-project)

    ;; package
    (global-set-key (kbd "C-c C-p") 'package-list-packages)

    (global-set-key (kbd "C-c f") 'neotree-toggle)
    (global-set-key (kbd "C-c s") 'eshell)
    ;;(global-set-key (kbd "C-c f f") '(shell-command '"astyle --style=kr"))
    (global-set-key (kbd "C-c r") 'revert-buffer)
    (global-set-key (kbd "C-c l") 'linum-mode)
    (global-set-key (kbd "C-c w") 'whitespace-mode)
    (if (eq system-type 'darwin)
        (global-set-key (kbd "C-c d") 'dash-at-point)
        (global-set-key (kbd "C-c d") 'zeal-at-point))
    ;;(global-set-key (kbd "C-c b") 'refill-mode)
    (global-set-key (kbd "C-c C-l") 'toggle-truncate-lines)

    (global-set-key (kbd "C-c e") 'emmet-mode)
    (global-set-key (kbd "C-c c") 'c++-mode)

    (global-set-key (kbd "C-x C-r") 'recentf-open-files)
    (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

    (if (eq system-type 'darwin)
        (global-set-key (kbd "C-c b b") 'browse-url-default-macosx-browser))
    (global-set-key (kbd "C-c b f") 'browse-url-firefox)
    (global-set-key (kbd "C-c b c") 'browse-url-chrome)

    (global-set-key (kbd "C-c h") 'hack-emacs))

(key-set)

(provide 'keyset)

;;; keyset.el ends here
