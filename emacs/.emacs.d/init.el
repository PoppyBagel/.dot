(require 'package)
(setcdr (last package-archives)
	'(("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist
    (pkg '(
      dockerfile-mode
      evil
      evil-matchit
      evil-nerd-commenter
      flycheck
      multiple-cursors
      neotree
      smart-mode-line
      smart-mode-line-powerline-theme
      terraform-mode
      yaml-mode ))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'evil)
(evilnc-default-hotkeys)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'projectile)
(projectile-mode t)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Python environments
(add-hook 'python-mode-hook #'pipenv-mode)

;; (require 'pyenv-mode)
;; (pyenv-mode)

;; (defun projectile-pyenv-mode-set ()
;;   "Set pyenv version matching project name."
;;   (let ((project (projectile-project-name)))
;;     (if (member project (pyenv-mode-versions))
;;         (pyenv-mode-set project)
;;       (pyenv-mode-unset))))

;; (add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(evil-mode t)
 '(global-evil-matchit-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; Happy coding! ^_^")
 '(package-selected-packages
   (quote
    (pipenv blacken magit projectile pyenv-mode smart-mode-line smart-mode-line-powerline-theme dockerfile-mode terraform-mode yaml-mode flycheck neotree multiple-cursors evil evil-nerd-commenter evil-matchit)))
 '(show-trailing-whitespace t)
 '(sml/theme (quote powerline))
 '(tool-bar-mode nil))

(sml/setup)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sml/col-number ((t (:inherit sml/global :background "dim gray"))))
 '(sml/filename ((t (:inherit sml/global :background "grey17" :foreground "DarkSlateGray1" :weight bold))))
 '(sml/folder ((t (:inherit sml/global :background "grey17" :foreground "DarkSlateGray4" :weight normal))))
 '(sml/line-number ((t (:inherit sml/global :background "black" :foreground "lemon chiffon" :weight bold))))
 '(sml/modes ((t (:inherit sml/global :background "gray40" :foreground "lemon chiffon"))))
 '(sml/modified ((t (:inherit sml/not-modified :foreground "indian red" :weight bold))))
 '(sml/position-percentage ((t (:inherit sml/prefix :background "gray40" :foreground "lemon chiffon" :weight normal))))
 '(sml/prefix ((t (:inherit sml/global :background "grey17" :foreground "PaleTurquoise4"))))
 '(sml/vc ((t (:inherit sml/git :background "grey40" :foreground "CadetBlue1"))))
 '(sml/vc-edited ((t (:inherit sml/prefix :background "gray40" :foreground "RosyBrown1")))))

(set-face-attribute 'default nil :font "Inconsolata-13")
(set-frame-font "Inconsolata-13" nil t)
(setq-default indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)
