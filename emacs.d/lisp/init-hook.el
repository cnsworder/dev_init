
;;(add-hook  'markdown-mode-hook 
;;    (lambda ()
;;      (global-set-key (kbd "C-c p") 'markdown-preview)))

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'python-mode-hook
          'anaconda-mode)
(add-hook 'python-mode-hook
          'hs-minor-mode t)

(add-hook 'c-mode-common-hook
          'hs-minor-mode)
(add-hook 'c-mode-hook
          'c++-mode)

(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c++11")
            (hs-minor-mode t)))

(provide 'init-hook)
