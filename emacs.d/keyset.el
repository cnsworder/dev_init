(defun key-set () 
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
   (global-set-key (kbd "C-c b") 'refill-mode)
   (global-set-key (kbd "C-c c") 'c++-mode)
   (global-set-key (kbd "C-c i") 'helm-imenu)
)
(key-set)

(provide 'key-set)
