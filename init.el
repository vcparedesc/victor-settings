(setq inhibit-startup-screen t )        ; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )      ; silent bell when you make a mistake
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; update packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package) ; guess what this one does too ?

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 1)

(use-package ace-window :ensure t)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x t") 'treemacs)

(global-display-line-numbers-mode)
(global-hl-line-mode 1)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l"))
(set-face-attribute 'nobreak-space nil :underline 'unspecified :inherit 'unspecified)  

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gdb-many-windows t)
 '(package-selected-packages
   (quote
    (all-the-icons-install-fonts helm-projectile cmake-mode treemacs-icons-dired all-the-icons counsel doom-themes use-package lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package req-package :ensure t)
(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-word-1)
  )

(general-define-key
 "C-x C-o" 'ff-find-other-file
 )
(use-package magit :ensure t)

(use-package counsel :ensure t)
(use-package ivy :ensure t)
(use-package swiper :ensure t)
(general-define-key
  ;; replace default keybindings
  "C-s" 'swiper             ; search for string in current buffer
  "M-x" 'counsel-M-x        ; replace default M-x with ivy backend
  "C-x C-f" 'counsel-find-file
  )

(use-package cmake-mode :ensure t)
(use-package projectile :ensure t)

(defun cmake-run-json()
  "Run cmake command in DIR."
  (interactive
  (with-eval-after-load 'projectile
    (defvar cmake-json-dir (projectile-project-root))
    (defvar cmake-json-build-dir (concat cmake-json-dir "build"))
    (let* ((default-directory cmake-json-build-dir)
           (compilation-buffer-name-function (lambda (major-mode-name) "*cmake*"))
           )
      (compile "cmake -j8 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && make -j8"))
    ))
  )

(defun c-run-executable()
  (interactive
   ;;(setq executable (read-string "Enter name: "))
   (with-eval-after-load 'projectile
     (defvar cmake-json-dir (projectile-project-root))
     (defvar cmake-build-dir (concat cmake-json-dir "build/"))

     (let* ( (default-directory cmake-build-dir)
     (executable (read-file-name "Enter name: ")))
     (setq foo (concat "exec " executable)))
     (shell-command  foo))
   )
  )

(defun c-quick-compile()
  (interactive)
  (let* ( (executable (read-file-name "Enter name: ")))
  (setq makecmd (concat "g++ " executable " -o output")) )
  (shell-command makecmd)
  (setq runcmd (concat "exec " default-directory "output"))
  ;;(shell-command runcmd)
  )

(defun c-quick-run()
  (interactive)
  (setq runcmd (concat "exec " default-directory "output"))
  (shell-command runcmd)
  )
  

(global-set-key (kbd "C-c c") 'cmake-run-json)
(global-set-key (kbd "C-c x") 'c-run-executable)
(global-set-key (kbd "C-c f c") 'c-quick-compile)
(global-set-key (kbd "C-c f x") 'c-quick-run)
(global-set-key (kbd "s-u") 'uncomment-region)




(add-to-list 'load-path "/opt/ros/noetic/share/emacs/site-lisp")
;; or whatever your install space is + "/share/emacs/site-lisp"
;; (require 'rosemacs-config)

(setq default-catkin-dir ( concat (getenv "HOME") "/catkin_ws"))
(defun ros-catkin-make ()
  "Run catkin_make command in DIR."
  (interactive
;;   (list (read-directory-name "Directory: "))
  (let* ((default-directory default-catkin-dir)
         (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
    (compile "catkin_make -j8 -DCMAKE_EXPORT_COMPILE_COMMANDS=1"))
  )
  )

;;(global-set-key (kbd "C-x C-r q") 'ros-catkin-make)
(global-set-key (kbd "s-u") 'uncomment-region)

(use-package org :ensure t)
(use-package all-the-icons :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

;; Use Helm in Projectile.
(use-package helm-projectile :ensure t)
(req-package helm-projectile
  :require helm projectile
  :config
  (progn
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)
    ))

(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(global-set-key (kbd "C-x p a") 'projectile-find-other-file)
(global-set-key (kbd "C-x p f") 'projectile-find-file)
(projectile-global-mode)
