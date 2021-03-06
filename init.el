;;(set-face-attribute 'default nil :height 110)

(setq delete-old-versions -1 )          ; delete excess backup versions silently
(setq version-control t )               ; use version control
(setq vc-make-backup-files t )          ; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )                                   ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )        ; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )      ; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )   ; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)    ; sentence SHOULD end with only a point.
(setq default-fill-column 80)           ; toggle wrapping text at the 80th character
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq initial-scratch-message "
Hello Victor, enjoy this programming session!
                                   :MMMo
                          `/hmo.  `mMMMM-  `+dh/`
                          `mMMMMdNMMMMMMMNdMMMMN.
                           -MMMMMMMMMMMMMMMMMMM/
                      .---:mMMMMMdo:-.-:ohMMMMMm:---.
                     .NMMMMMMMMh.         .yMMMMMMMMN.
                     .omMMMMMMs             sMMMMMMms.        .::-
                        :MMMMM`             `MMMMM:    .`    `+ooo-    `.`
                       .oMMMMM-             .MMMMMo` -ooo+-.-/ooooo:../ooo/
                     -dMMMMMMMd`           `hMMMMMMMh-+ooooooooooooooooooo.
              syyo   `mMNNMMMMMm/`        /mMMMMMNNMm`/oooooo+////+oooooo+`
     `:o/`   :mmmm:   `/o-`yMMMMMNhs+++shNMMMMMy.////+oooo+-`      `-+ooooo////.
     smmmdsoydmmmmdyoodmmm+oMMMMMMMMMMMMMMMMMMM+:oooooooo/            -oooooooo+
     `hmmmmmmmmmmmmmmmmmmh-MMMMdoymMMMMMmhsmMMMN``-+oooo+              /ooooo:.
     :dmmmmmyo+//+ohmmmmmh-.os-   `NMMMd    -so.   :oooo/              -oooo/
+mdddmmmmdo`        .smmmmmdddm-   :ddd-        `-/ooooo+`             /ooooo/-`
odmmmmmmd-            /mmmmmmmd+                :oooooooo+`          `/oooooooo+
  -hmmmm+              ymmmmy-                   ::--/ooooo/.`    `.:ooooo+--::`
  `ymmmm+              smmmmo                         /oooooooo++oooooooo+
/ymmmmmmh`            -dmmmmmdo-                     .oooooooooooooooooooo.
smmmmmmmmh:          /dmmmmmmmm+                     .+o+:``./oooo/.``:+o+-
`---.ommmmmho:-..-/odmmmmd/----                        `     `oooo`     `
     `hmmmmmmmmmmmmmmmmmmo                                    `..`
     smmmmhhdmmmmmmdhdmmmm:
     -oho.   smmmm:   :sh+.
             .dmms
") ; print a default message in the empty scratch buffer opened at startup

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("elpy"      . "https://jorgenschaefer.github.io/packages/")))
(package-initialize) ; guess what this one does ?

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; update packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package) ; guess what this one does too ?

;;(use-package modern-cpp-font-lock :ensure t)
;;(set-frame-font "DejaVu Sans Mono-11" nil t)

(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-word-1)
  )

;(use-package sublime-themes :ensure t)
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
                                        ;(load-theme 'granger t)

;;(use-package dracula-theme :ensure t)
;; Don't change the font size for some headings and titles (default t)
;;(setq dracula-enlarge-headings nil)

;; Adjust font size of titles level 1 (default 1.3)
;;(setq dracula-height-title-1 1.25)

;; Adjust font size of titles level 2 (default 1.1)
;;(setq dracula-height-title-1 1.15)

;; Adjust font size of titles level 3 (default 1.0)
;;(setq dracula-height-title-1 1.05)

;; Adjust font size of document titles (default 1.44)
;;(setq dracula-height-doc-title 1.4)

;; Use less pink and bold on the mode-line and minibuffer (default nil)
;;(setq dracula-alternate-mode-line-and-minibuffer t)

;;(load-theme 'dracula t)

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

(use-package nyan-mode :ensure t)

(use-package avy :ensure t
  :commands (avy-goto-word-1))

(use-package counsel :ensure t)
(use-package ivy :ensure t)
(use-package swiper :ensure t)

(use-package which-key
  :ensure t
  :config
    (which-key-mode))

(use-package general :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

    ;; simple command
    "'"   '(iterm-focus :which-key "iterm")
    "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
    "/"   'counsel-ag
    ;;"TAB" '(switch-to-other-buffer :which-key "prev buffer")
    ;;"SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")

    ;; Applications
    "a" '(:ignore t :which-key "Applications")
    "ar" 'ranger
    "ad" 'dired))

(use-package ein :ensure t)
;; (require 'ein)
;; (require 'ein-loaddefs)
;; (require 'ein-notebook)
;; (require 'ein-subpackages)
(setq ein:output-area-inlined-images t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Python support
;;(setq python-python-command "/usr/bin/python3.6")
;;(setq python-shell-interpreter "/usr/bin/python3.6")
;;(setq shell-file-name "~/.emacs.d/bin/eshell")
(setenv "ESHELL" (expand-file-name "~/.emacs.d/bin/eshell"))
(set-face-attribute 'comint-highlight-prompt nil
                    :inherit nil)

(use-package jedi :ensure t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(use-package yasnippet :ensure t)
(yas-global-mode 1)
(use-package sphinx-doc :ensure t)
(use-package python-docstring :ensure t)
(use-package cmake-mode :ensure t)
(add-to-list 'load-path (expand-file-name "/home/victor/pyvenv/"))
;;(setenv "WORKON_HOME" (concat (getenv "CONDA_PREFIX") "/envs"))
(setenv "WORKON_HOME" "/home/victor/anaconda3/envs")
(require 'pyvenv)
(pyvenv-mode 1)

(use-package anaconda-mode :ensure t)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)


(use-package json :ensure t)
(use-package flycheck :ensure t)

(defun my-parse-jslinter-warning (warning)
  (flycheck-error-new
   :line (1+ (cdr (assoc 'line warning)))
   :column (1+ (cdr (assoc 'column warning)))
   :message (cdr (assoc 'message warning))
   :level 'error
   :buffer (current-buffer)
   :checker 'javascript-jslinter))
(defun jslinter-error-parser (output checker buffer)
  (mapcar 'parse-jslinter-warning
          (cdr (assoc 'warnings (aref (json-read-from-string output) 0)))))
(flycheck-define-checker javascript-jslinter
  "A JavaScript syntax and style checker based on JSLinter.

See URL `https://github.com/tensor5/JSLinter'."
  :command ("c:/Users/Felix/AppData/Roaming/npm/jslint" "--raw" source)
  :error-parser jslinter-error-parser
  :modes (js-mode js2-mode js3-mode))

(use-package highlight-parentheses :ensure t)

(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
  (lambda nil (highlight-parentheses-mode t)))

(global-highlight-parentheses-mode t)

(use-package cl-lib :ensure t)
(use-package json :ensure t)
;(use-package company-irony :ensure t)
;;(use-package company-c-headers :ensure t)
;;(use-package auto-complete-clang :ensure t)

(use-package req-package :ensure t)

(req-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0)))


(req-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

(use-package projectile :ensure t)
(req-package projectile
  :config
  (progn
    (projectile-global-mode)
    (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
    )
  )

(use-package helm :ensure t)
(req-package helm
  :config
  (progn
    (require 'helm-config)

    ;; Use C-c h instead of default C-x c, it makes more sense.
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (setq
     ;; move to end or beginning of source when reaching top or bottom of source.
     helm-move-to-line-cycle-in-source t
     ;; search for library in `require' and `declare-function' sexp.
     helm-ff-search-library-in-sexp t
     ;; scroll 8 lines other window using M-<next>/M-<prior>
     helm-scroll-amount 8
     helm-ff-file-name-history-use-recentf t
     helm-echo-input-in-header-line t)

    (global-set-key (kbd "M-x") 'helm-M-x)
    (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

    ;;(global-set-key (kbd "C-x C-f") 'helm-find-files)

    (global-set-key (kbd "M-y") 'helm-show-kill-ring)

    (global-set-key (kbd "C-x b") 'helm-mini)
    (setq helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t)

    ;; TOOD: helm-semantic has not syntax coloring! How can I fix that?
    (setq helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match t)

    ;; Lists all occurences of a pattern in buffer.
    (global-set-key (kbd "C-c h o") 'helm-occur)

    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

    ;; open helm buffer inside current window, not occupy whole other window
    (setq helm-split-window-in-side-p t)
    (setq helm-autoresize-max-height 50)
    (setq helm-autoresize-min-height 30)
    (helm-autoresize-mode 1)

    (helm-mode 1)
    ))

;; Use Helm in Projectile.
(use-package helm-projectile :ensure t)
(req-package helm-projectile
  :require helm projectile
  :config
  (progn
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)
    ))

;; Linum Mode
(global-linum-mode 1)
(global-hl-line-mode +1)

(winner-mode 1)

(setq nyan-animate-nyancat t)
(nyan-mode t)
(nyan-start-animation)


;;(defvar my-cpp-other-file-alist '(("\\.cpp\\'" (".h")) ("\\.h\\'" (".cpp")))) (setq-default ff-other-file-alist 'my-cpp-other-file-alist)

(general-define-key
 "C-x C-o" 'ff-find-other-file
 )

(use-package better-defaults :ensure t)
(use-package elpy :ensure t)
(use-package py-autopep8 :ensure t)

(elpy-enable)
(setq elpy-rpc-backend "jedi")

(defun elpy-goto-definition-or-rgrep ()
  "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
    (interactive)
    (ring-insert find-tag-marker-ring (point-marker))
    (condition-case nil (elpy-goto-definition)
        (error (elpy-rgrep-symbol
                (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))
(define-key elpy-mode-map (kbd "M-.") 'elpy-goto-definition-or-rgrep)
;;(define-key elpy-mode-map (kbd "C-c g") 'elpy-goto-definition)
(define-key elpy-mode-map (kbd "C-c
 o") 'elpy-occur-definitions)
(define-key elpy-mode-map (kbd "C-c u") 'pop-tag-mark)


(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; adding matlab mode, consider to separate packages into files
;;(add-to-list 'load-path "~/matlab-emacs-src")
;;(load-library "matlab-load")
;; Enable CEDET feature support for MATLAB code. (Optional)
;;(matlab-cedet-setup)

(use-package exec-path-from-shell :ensure t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(windmove-default-keybindings)
(use-package multi-term
  :ensure t
  :config
  (progn
    (local-set-key (kbd "C-/") 'term-send-backspace)
    )
  )

(use-package ace-window :ensure t)
(global-set-key (kbd "M-o") 'ace-window)
(req-package-finish)

(use-package magit :ensure t)

(general-define-key
 :prefix "C-c"
 ;; bind to simple key press
  "b"   'ivy-switch-buffer  ; change buffer, chose using ivy
  "/"   'counsel-git-grep   ; find string in git project
  ;; bind to double key press
  "fr"  'counsel-recentf
  "p"   '(:ignore t :which-key "project")
  "pf"  '(counsel-git :which-key "find file in git dir")
  )

(general-define-key
  ;; replace default keybindings
  "C-s" 'swiper             ; search for string in current buffer
  "M-x" 'counsel-M-x        ; replace default M-x with ivy backend
  "C-x C-f" 'counsel-find-file
  )

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-expand-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-litter-directories            '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(global-set-key (kbd "C-x t") 'treemacs)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package sr-speedbar :ensure t)

(setq ido-enable-flex-matching t)
(ido-mode 1)

(use-package lsp-mode
  
  :ensure t
  :hook (
         (c++-mode . lsp)
         (c-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration) )
  :config
  (progn
    (require 'cc-mode)
    (define-key c-mode-base-map (kbd "C-c g") 'lsp-find-definition)
    (define-key c-mode-base-map (kbd "C-c r") 'lsp-find-references)
    )
  :commands lsp)
                                        ;(lsp-clients-register-clangd)


;; optionally
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol :ensure t)
;; if you are ivy user
;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol :ensure t)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list :ensure t)

;; optionally if you want to use debugger
(use-package dap-mode :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;;(helm-mode)
(use-package helm-xref :ensure t)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)


(setq lsp-clients-clangd-args '("--compile-commands-dir=build"
                                          "--pch-storage=memory"
                                          "--background-index"
                                          "--query-driver"
                                          "-j=4"
                                          ))
(setq lsp-clangd-binary-path "/usr/bin/clangd")


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

(global-set-key (kbd "C-c c") 'cmake-run-json)

(custom-set-variables '(gdb-many-windows t))

(add-to-list 'load-path "/opt/ros/noetic/share/emacs/site-lisp")
;; or whatever your install space is + "/share/emacs/site-lisp"
(require 'rosemacs-config)

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

(global-set-key (kbd "C-x C-r q") 'ros-catkin-make)
(global-set-key (kbd "s-u") 'uncomment-region)

(use-package org :ensure t)
(use-package all-the-icons :ensure t)

;; Org Mode Configuration ------------------------------------------------------

(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "IBM Plex Serif" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :ensure t
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-hide-emphasis-markers t)
  (efs/org-font-setup))

(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 200
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :ensure t
  :hook (org-mode . efs/org-mode-visual-fill))

(provide 'init)
;;; init.el ends here
