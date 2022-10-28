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
  (setq doom-themes-treemacs-theme "doom-one") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 1)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;;(tab-bar-mode 1)

;;(use-package exwm :ensure t)
;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-example)

;;(exwm-workspace-switch 1)
;;(start-process-shell-command "firefox" nil "firefox")
;;(sleep-for 3)

(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-`"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package highlight-indent-guides :ensure t)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;; We then install fira-code-mode-install-fonts
(use-package fira-code-mode
  :ensure t
  :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x")) ;; List of ligatures to turn off
  :config (fira-code-mode-set-font)
  :hook prog-mode) ;; Enables fira-code-mode automatically for programming major modes

;; vterm requirement, DO: sudo apt install libtool-bin 
(use-package vterm
  :ensure t
  :config
  (setq vterm-timer-delay 0.01)
  (global-set-key (kbd "C-x t v") 'multi-vterm)  
  )
(use-package multi-vterm :ensure t)

(winner-mode 1)

(use-package ace-window :ensure t)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x t t") 'treemacs)

(global-display-line-numbers-mode)
(global-hl-line-mode 1)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l"))
(set-face-attribute 'nobreak-space nil :underline 'unspecified :inherit 'unspecified)
;;(setq lsp-ui-doc-position 'at-point)
(use-package lsp-ui :ensure t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-use-childframe nil)
(setq lsp-headerline-breadcrumb-enable-diagnostics nil)

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
   '(smart-tabs-mode company-box python-mode perspective lsp-ui treemacs-projectile exwm multi-vterm vterm highlight-indent-guides fira-code-mode all-the-icons-install-fonts helm-projectile cmake-mode treemacs-icons-dired all-the-icons counsel doom-themes use-package lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  ;; (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(setq indent-tabs-mode t)
(setq lsp-diagnostics-provider :none)
;; (use-package company
;;   :after lsp-mode
;;   :hook (lsp-mode . company-mode)
;;   :bind (:map company-active-map
;;          ("<tab>" . company-complete-selection))
;;         (:map lsp-mode-map
;;          ("<tab>" . company-indent-or-complete-common))
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.0))

;; (use-package company-box
;;   :hook (company-mode . company-box-mode))

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
  

(global-set-key (kbd "C-c g") 'lsp-find-definition)
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

(global-set-key (kbd "C-x r q") 'ros-catkin-make)
(global-set-key (kbd "s-u") 'uncomment-region)

(use-package org :ensure t)
(use-package all-the-icons :ensure t)

(use-package treemacs-projectile :ensure t)

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
