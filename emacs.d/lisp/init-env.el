
(if (eq system-type 'darwin)
    (progn
      (setq exec-path (append exec-path '("/Users/crossorbit/bin")))
      (setq exec-path (append exec-path '("/usr/local/bin")))))

(setq backup-directory-alist '(("." . "/tmp")))
(setenv "PATH" (concat ".:/Users/crossorbit/bin/:/usr/local/bin:" (getenv "PATH")))

(provide 'init-env)
