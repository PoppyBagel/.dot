(require 'package)
(setcdr (last package-archives)
	'(("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist
    (pkg '(evil
	   evil-args
	   evil-matchit
	   evil-nerd-commenter
	   evil-surround
	   multiple-cursors
	   neotree))
  (unless (package-installed-p pkg)
    (package-install pkg)))
	   
(require 'evil)
(require 'neotree)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes (quote (default)))
 '(evil-mode t)
 '(global-evil-matchit-mode t)
 '(global-evil-surround-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :font "Inconsolata-15")
(set-frame-font "Inconsolata-15" nil t)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key [f8] 'neotree-toggle)
(evilnc-default-hotkeys)
