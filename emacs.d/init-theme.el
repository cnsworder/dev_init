
(require 'tabbar)
;;(setq tabbar-buffer-groups-function nil)
(tabbar-mode t)

;;(require 'sr-speedbar)
;;(setq speedbar-show-unknown-files t)
;;(setq speedbar-use-images nil)

(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)

(global-hl-line-mode t)

(nyan-mode t)

;;暗色主题下光标颜色设置一下
(set-cursor-color "White")

;;去掉工具栏
(if window-system
   (tool-bar-mode 0))

;;开启折叠
;;(hs-minor-mode t)
;;显示行号
(global-linum-mode)

(setq inhibit-startup-message t)

(provide 'init-theme)
