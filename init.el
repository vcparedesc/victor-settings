(set-face-attribute 'default nil :height 140)

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

(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-word-1)
  )

(use-package dracula-theme :ensure t)
(load-theme 'dracula t)
(use-package nyan-mode :ensure t)

(use-package avy :ensure t
  :commands (avy-goto-word-1))

(use-package counsel :ensure t)
(use-package ivy :ensure t)
(use-package swiper :ensure t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-clang-analyzer auto-complete-clang jedi ac-clang magit company-c-headers company-rtags neotree el-get req-package cmake-mode helm-projectile helm-rtags helm projectile flycheck-rtags cmake-ide ace-window exec-path-from-shell sr-speedbar highlight-parentheses sphinx-doc yasnippet py-autopep8 elpy better-defaults eink-theme company-irony flycheck-irony irony-eldoc irony flycheck python-docstring ein-mumamo which-key use-package latex-pretty-symbols ipython general ein counsel avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Python support
(use-package yasnippet :ensure t)
(yas-global-mode 1)
(use-package sphinx-doc :ensure t)
(use-package python-docstring :ensure t)
(use-package cmake-mode :ensure t)

(use-package json :ensure t)
(use-package flycheck :ensure t)
(use-package cmake-ide :ensure t)

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
(use-package irony :ensure t)
(use-package irony-eldoc :ensure t)
(use-package flycheck-irony :ensure t)
(use-package company-irony :ensure t)
(use-package company-c-headers :ensure t)

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

(req-package irony
  :config
  (progn
    ;; If irony server was never installed, install it.
    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))

    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)

    ;; Use compilation database first, clang_complete as fallback.
    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                      irony-cdb-clang-complete))

    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    ))

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))
;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

  ;; I use irony with company to get code completion.
  (req-package company-irony
    :require company irony
    :config
    (progn
      (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
(add-to-list 'company-backends 'company-c-headers)

  ;; I use irony with flycheck to get real-time syntax checking.
  (req-package flycheck-irony
    :require flycheck irony
    :config
    (progn
      (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

  ;; Eldoc shows argument list of the function you are currently writing in the echo area.
  (req-package irony-eldoc
    :require eldoc irony
    :config
    (progn
      (add-hook 'irony-mode-hook #'irony-eldoc)))


(use-package rtags :ensure t)
(req-package rtags
  :config
  (progn
    (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
    (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

    (define-key c-mode-base-map (kbd "C-c g") 'rtags-find-symbol-at-point)
    (define-key c-mode-base-map (kbd "C-c r") 'rtags-find-references-at-point)
    (define-key c-mode-base-map (kbd "C-c s") 'rtags-display-summary)
    ;;(define-key c-mode-base-map (kbd "TAB") 'irony-mode-map)
    (define-key c-mode-base-map (kbd "<backtab>") 'company-c-headers)
    (rtags-enable-standard-keybindings)

    (setq rtags-use-helm t)

    ;; Shutdown rdm when leaving emacs.
    (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
    ))


(use-package projectile :ensure t)
(req-package projectile
  :config
  (progn
    (projectile-global-mode)
    ))

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
;(use-package helm-projectile :ensure t)
;(req-package helm-projectile
;  :require helm projectile
;  :config
;  (progn
;    (setq projectile-completion-system 'helm)
;    (helm-projectile-on)
;    ))

(global-set-key (kbd "C-c c") 'cmake-ide-compile)
(global-set-key (kbd "C-c m") 'cmake-ide-run-cmake)

;; Linum Mode
(global-linum-mode 1)
(global-hl-line-mode +1)

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

(use-package ace-window :ensure t)
(global-set-key (kbd "M-o") 'ace-window)
(req-package-finish)

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

(use-package neotree :ensure t)
(setq cmake-ide-build-dir "build")
(setq irony-cdb-search-directory-list "build")

(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)
