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

(cscope-minor-mode t)
(ggtags-mode t)
;;(ggtags-global-mode t)

(require 'flycheck)
(global-flycheck-mode t)
(flycheck-ycmd-setup)

;;(require 'company)
;;(require 'company-clang)
;;(require 'company-gtags)
;;(setq company-idle-delay t)
;;(company-mode t)
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9.2/")
(global-company-mode t)
(setq company-idle-delay 0.08)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-require-match nil)

;;(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends '(company-keywords
                                    company-files
                                    company-abbrev
                                    company-yasnippet
                                    company-dabbrev
                                    company-gtags
                                    company-etags
                                    company-eclim
                                    company-elisp))

;; (setq ycmd-bin (list
;;                 "python"
;;                (expand-file-name "~/dev/ycmd/ycmd")))
;; (setq-default ycmd-server-command ycmd-bin)
(setq-default ycmd-server-command
    `("python" ,(expand-file-name "~/.vim/plugged/YouCompleteMe/third_party/ycmd/ycmd")))

(setq-default ycmd-global-config
    (expand-file-name
        "~/dev/ycmd/cpp/ycm/.ycm_extra_conf.py"))

(setq-default ycmd-min-num-chars-for-completion 1)
(setq-default ycmd-seed-identifiers-with-keywords t)

;;(global-ycmd-mode)
;;(add-hook 'c++-mode-hook 'ycmd-mode)
(company-ycmd-setup)

(add-hook 'emacs-lisp-hook
    (lambda()
          (setq (make-local-variable 'company-backends)
                '(company-elisp
                  company-yasnippet
                  company-eclim
                  company-abbrev
                  company-dabbrev))))

(require 'company-go)
(add-hook 'go-mode-hook
          (add-to-list 'company-backends 'company-go))

;;(require 'cedet)
;;(load-file "/usr/share/emacs/24.3/lisp/cedet/cedet.elc")
;;(require 'ecb)
;;(require 'eassist)
;;(require 'auto-complete)



;;(setq auto-mode-alist
;;      (append
;;        '(("\\.html\\'" . web-mode)
;;          ("\\.js\\'" . js2-mode))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(emmet-mode t)

;; (add-hook  'markdown-mode-hook
;;    (lambda ()
;;      (global-set-key (kbd "C-c p") 'markdown-preview)))
;;

(defun *init-python* ()

    "Init python."

    (interactive )
    (anaconda-mode t)
    (hs-minor-mode t)
    (elpy-mode t)
    (elpy-enable)
    (elpy-use-ipython)
    (aggressive-indent-mode nil)
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

(add-hook 'c-mode-common-hook
    (lambda ()
        (interactive "")
        (require 'google-c-style)
        (require 'flycheck-google-cpplint)
        (ycmd-mode t)
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


(add-hook 'prog-mode-hook 'aggressive-indent-mode)
(provide 'init-dev)

;;; init-dev.el ends here
