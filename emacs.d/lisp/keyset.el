
;;; Code

(defun key-set () 
   "设置快捷键"
   
   (interactive)

   ;; meta键调整
   (if (eq system-type 'darwin)
       (progn
        (setq mac-command-modifier 'meta)
        (setq mac-control-modifier 'control)
        (setq mac-option-modifier 'alt)))
   
   ;;避免输入法切换冲突
   (global-unset-key (kbd "C-SPC"))
   
   ;;快捷键设置
   (global-set-key (kbd "M-x") 'counsel-M-x)
   (global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
   (global-set-key (kbd "C-x C-f") 'counsel-find-file)

   (global-set-key (kbd "C-s") 'swiper)
   (global-set-key (kbd "C-c r") 'ivy-resume)
   (global-set-key (kbd "C-c i") 'counsel-imenu)
   (global-set-key (kbd "C-c g") 'counsel-git)
   (global-set-key (kbd "C-c a") 'counsel-ag)
   (global-set-key (kbd "C-c e") 'hippie-expand)
   (global-set-key (kbd "C-c b") 'counsel-bookmark)

   (global-set-key (kbd "C-c m") 'bookmark-set)

   (global-set-key (kbd "C-h v") 'counsel-describe-variable)
   (global-set-key (kbd "C-h f") 'counsel-describe-function)

   ;; git 相关
   (global-set-key (kbd "C-c C-g c") 'magit-commit)
   (global-set-key (kbd "C-c C-g p") 'magit-push)
   (global-set-key (kbd "C-c C-g f") 'magit-pull)
   (global-set-key (kbd "C-c C-g s") 'magit-status)
   (global-set-key (kbd "C-c C-g d") 'magit-diff)

   (global-set-key (kbd "<f3>") 'sr-speedbar-toggle)
   (global-set-key (kbd "<f4>") 'eshell)
   ;;(global-set-key (kbd "<f5>") '(shell-command '"astyle --style=kr"))
   (global-set-key (kbd "<f2>") 'revert-buffer)
   (global-set-key (kbd "<f6>") 'linum-mode)
   (global-set-key (kbd "<f7>") 'whitespace-mode)
   (if (eq system-type 'darwin)
       (global-set-key (kbd "C-c d") 'dash-at-point)
       (global-set-key (kbd "C-c d") 'zeal-at-point))
   ;;(global-set-key (kbd "C-c b") 'refill-mode)
   (global-set-key (kbd "C-c l") 'toggle-truncate-lines)
   
   (global-set-key (kbd "C-c c") 'c++-mode)
   (global-set-key (kbd "C-x C-r") 'recentf-open-files)
   (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
   )

(key-set)

(provide 'keyset)
