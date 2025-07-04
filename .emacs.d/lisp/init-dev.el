;;; package --- init-dev
;;; Commentary:
;;; Code:

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(use-package yasnippet
  :ensure t
  :hook
  (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  (yas-global-mode t))

(use-package yasnippet-snippets
             :ensure t
             :after yasnippet)

(use-package dumb-jump
  :bind
  (("M-g o" . dumb-jump-go-other-window)
   ("M-g j" . dumb-jump-go)
   ("M-g i" . dumb-jump-go-prompt)
   ("M-g x" . dumb-jump-go-prefer-external)
   ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (dumb-jump-mode)
  (setq dumb-jump-selector 'ivy))

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode t))

;; $PATH
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; 缩进线
(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode))

(use-package fic-mode)

(use-package format-all
  :ensure t
  :defer t
  :hook (prog-mode . format-all-mode)
  :bind ("C-c f f" . #'format-all-region-or-buffer))

(use-package xcscope
  :ensure t
  :config
  (cscope-minor-mode t))

(use-package ggtags
  :ensure t
  :config
  (ggtags-mode t))

(use-package eglot
  :ensure t
  :hook (prog-mode . eglot-ensure)
  :bind ("C-c e f" . eglot-format))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (sh-mode . lsp-deferred))
  :commands (lsp lsp-deferred))

;; debug mode
;;(use-package dap-mode)
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-position 'top)
  :commands
  lsp-ui-mode)
(use-package lsp-ivy
  :ensure t
  :after (lsp-mode)
  :commands lsp-ivy-workspace-symbol)

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.03)
  (setq company-show-numbers t)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-anotations t)
  (define-key company-active-map (kbd "M-/") #'company-complete)
  (add-to-list 'company-backends '(company-keywords
                                   company-files
                                   company-abbrev
                                   company-yasnippet
                                   company-dabbrev
                                   company-lsp
                                   company-gtags
                                   company-etags
                                   company-elisp))
  )

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))


;;(add-hook 'after-init-hook 'global-company-mode)


(add-hook 'emacs-lisp-hook
          (lambda()
            (setq (make-local-variable 'company-backends)
                  '(company-elisp
                    company-yasnippet
                    company-abbrev
                    company-dabbrev))))

;; (use-package company-go
;; :config
;; (add-hook 'go-mode-hook
;; (add-to-list 'company-backends 'company-go)))

;;(setq auto-mode-alist
;;      (append
;;        '(("\\.html\\'" . web-mode)
;;          ("\\.js\\'" . js2-mode))))

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode))
(use-package vue-mode
  :mode "\\.vue\\'")

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(use-package emmet-mode
  :ensure t
  :bind
  ("C-c m e" . emmet-mode)
  :config
  (emmet-mode t))

;; (add-hook  'markdown-mode-hook
;;    (lambda ()
;;      (global-set-key (kbd "C-c p") 'markdown-preview)))
;;

(defun *init-python* ()

  "Init python."

  (interactive )
  (anaconda-mode t)
  (hs-minor-mode t)
  (elpy-enable)
  (elpy-mode t)
  (setq elpy-rpc-python-command "python3")
  (aggressive-indent-mode nil)
  (setq company-backends '(elpy-company-backend
                           (company-keywords
                            company-files
                            company-gtags
                            company-etags
                            company-yasnippet
                            company-abbrev
                            company-dabbrev)
                           company-bbdb
                           company-nxml
                           company-lsp
                           company-css
                           company-files
                           (company-dabbrev-code
                            company-gtags
                            company-etags
                            company-keywords)
                           company-oddmuse
                           company-dabbrev)))

(add-hook 'python-mode-hook
          (lambda ()
            (interactive "")
            (*init-python*)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (interactive "")
            (require 'google-c-style)
            (require 'flycheck-google-cpplint)
            (flycheck-add-next-checker 'c/c++-clang
                                       'c/c++-googlelint '(append ))
            (google-set-c-style)
            (google-make-newline-indent)
            (setq c-default-style "K&R")
            (setq c-basic-offset 4)
            (add-to-list 'company-backends '(company-clang
                                             company-c-headers
                                             company-cmake))))

(add-hook 'c-mode-hook
          'c++-mode)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

(use-package aggressive-indent
    :ensure t
    :config
    (global-aggressive-indent-mode 1)
    (add-to-list 'aggressive-indent-excluded-modes 'python-mode))
;; (add-hook 'prog-mode-hook 'aggressive-indent-mode)
(provide 'init-dev)

;;; init-dev.el ends here
