;;; package --- init-dev
;;; Commentary:
;;; Code:

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(require 'yasnippet)
(yas-global-mode t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; editorconfig
(require 'editorconfig)
(editorconfig-mode t)

;; $PATH
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; 缩进线
(indent-guide-global-mode)

(require 'git-gutter)
(global-git-gutter-mode t)
(git-gutter:linum-setup)

;; (require 'projectile)
;; (projectile-global-mode)

(ggtags-mode t)
;;(ggtags-global-mode t)

(require 'flycheck)
(global-flycheck-mode t)

(global-company-mode t)
(setq company-idle-delay 0.08)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-require-match nil)

(add-to-list 'company-backends '(company-keywords
                                     company-files
                                     company-abbrev
                                     company-yasnippet
                                     company-dabbrev
                                    company-gtags
                                        company-etags
                                    company-eclim
                                    company-elisp))

(global-set-key (kbd "C-c o") 'company-complete)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(emmet-mode t)


(defun *init-python* ()

  "Init python."

  (interactive )
  (anaconda-mode t)
  (hs-minor-mode t)
  (elpy-mode t)
  (elpy-enable)
  (elpy-use-ipython)
  (setq company-backends '(elpy-company-backend
                           company-ycmd
                           (company-keywords
                            company-files
                            company-gtags
                            company-etags
                            company-yasnippet
                            company-abbrev
                            company-dabbrev)
                           company-bbdb
                           company-nxml
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

(add-hook 'c-mode-hook
          'c++-mode)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")))

(provide 'init-dev)

;;; init-dev.el ends here
