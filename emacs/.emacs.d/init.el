(require 'package)
(setcdr (last package-archives)
	'(("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.org/packages/")
	  ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist
    (pkg '(
      elpy
      evil
      evil-args
      evil-matchit
      evil-nerd-commenter
      evil-surround
      flycheck
      ipython
      multiple-cursors
      neotree
      py-autopep8
      py-import-check))
  (unless (package-installed-p pkg)
    (package-install pkg)))
	   
(require 'evil)
(evilnc-default-hotkeys)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Elpy
(elpy-enable)
(pyvenv-activate (expand-file-name "~/.anaconda3/envs/default-py3"))
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")
(remove-hook 'elpy-modules 'elpy-module-highlight-indentation)

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

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
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; Happy coding! ^_^")
 '(package-selected-packages
   (quote
    (ipython flycheck py-autopep8 elpy py-import-check neotree multiple-cursors evil-surround evil-nerd-commenter evil-matchit evil-args)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :font "Inconsolata-15")
(set-frame-font "Inconsolata-15" nil t)

(fset 'yes-or-no-p 'y-or-n-p)
