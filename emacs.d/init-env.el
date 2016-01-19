
(if (eq system-type 'darwin)
    (setq exec-path (append exec-path '("/Users/crossorbit/bin"))))

(setq backup-directory-alist '(("." . "/tmp")))
(setenv "PATH" (concat ".:/Users/crossorbit/bin/:" (getenv "PATH")))

(provide 'init-env)
