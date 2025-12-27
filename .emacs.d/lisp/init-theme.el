;;; packates init-theme
;;; Code:

;; 显示行号
(global-display-line-numbers-mode t)
(column-number-mode t)
(display-line-numbers-mode)

(setq inhibit-startup-message t)
(use-package highlight-parentheses
  :ensure t
  :config
  (global-highlight-parentheses-mode t))

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Maple Mono Normal NF CN"))

(use-package spaceline
  :ensure t
  :config
  (spaceline-spacemacs-theme))

(use-package popwin
  :ensure t
  :config
  (popwin-mode t))

(use-package ef-themes
  :ensure t
  :init
  (ef-themes-take-over-modus-themes-mode 1)
  :config
  (setq ef-themes-mixed-fonts t)
  (setq ef-themes-variable-pitch-ui t)
  (modus-themes-load-theme 'ef-deuteranopia-light))

;; (use-package gruvbox-theme)


;; 暗色主题下光标颜色设置一下
;;(set-cursor-color "White")
(setq-default cursor-type 'bar)

(defun frame-ui (&optional frame)
  (when (display-graphic-p)
    ;; 去掉工具栏
    (if window-system
        (tool-bar-mode 0))
    )

  ;; 开启折叠
  ;; (hs-minor-mode t)
  ;; 去掉滚动条
  ;;(scroll-bar-mode 0)
  ;;(fringe-mode 0)

  ;; 字体配置
  ;;(set-default-font "SauceCodePro Nerd Font 16")
  (set-frame-font "-*-maple mono normal nf cn-medium-normal-*-16-*")
  (set-frame-font (font-spec :family "Maple Mono Normal NF CN" :size 16))
  )

(defun frame-ui-in-daemon (frame)
  "Reload the theme (and font) in an daemon frame."
  (when (or (daemonp) (not (display-graphic-p)))
    (with-selected-frame frame
      (run-with-timer 0.1 nil #'frame-ui))))

(if (daemonp)
    (add-hook 'after-make-frame-functions #'frame-ui-in-daemon)
  (frame-ui))

(provide 'init-theme)

;;; init-theme.el ends here
