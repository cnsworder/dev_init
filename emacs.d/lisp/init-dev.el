;;; package --- init-dev
;;; Commentary:
;;; Code:

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(require 'yasnippet)
(yas-global-mode t)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(require 'git-gutter)
(global-git-gutter-mode t)
(git-gutter:linum-setup)

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
(add-to-list 'company-backends '(
                                 company-keywords
                                 company-files
                                 company-gtags
                                 company-yasnippet
                                 company-abbrev
                                 company-eclim
                                 company-elisp
                                 company-dabbrev))

(global-set-key (kbd "C-c o") 'company-complete)

;; (setq ycmd-bin (list
;;                 "python"
;;                (expand-file-name "~/dev/ycmd/ycmd")))
;; (setq-default ycmd-server-command ycmd-bin)
 (setq-default ycmd-server-command
              `("python" ,(expand-file-name "~/dev/ycmd/ycmd")))

(setq-default ycmd-global-config
              (expand-file-name
               "~/dev/ycmd/cpp/ycm/.ycm_extra_conf.py"))

(global-ycmd-mode)
;;(add-hook 'c++-mode-hook 'ycmd-mode)
(company-ycmd-setup)

(require 'company-go)
(add-hook 'go-mode-hook
          (add-to-list 'company-backends 'company-go))

(add-hook 'python-mode-hook
          ((lambda ()
             (interactive "")
           (elpy-enable)
           (elpy-use-ipython))))

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


;; (add-hook  'markdown-mode-hook
;;    (lambda ()
;;      (global-set-key (kbd "C-c p") 'markdown-preview)))
;;

(defun *init-python* ()

  "Init python."
  
  (interactive )
  (anaconda-mode t)
  (hs-minor-mode t)
  )

(add-hook 'python-mode-hook
          '*init-python*)

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
          '(lambda ()
            (setq flycheck-clang-language-standard "c++11")))

(provide 'init-dev)

;;; init-dev.el ends here
