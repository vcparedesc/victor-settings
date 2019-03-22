(set-face-attribute 'default nil :height 120)

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
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

(general-define-key
  ;; replace default keybindings
  "C-s" 'swiper             ; search for string in current buffer
  "M-x" 'counsel-M-x        ; replace default M-x with ivy backend
  )

(general-define-key
 :prefix "C-c"
 ;; bind to simple key press
  "b"	'ivy-switch-buffer  ; change buffer, chose using ivy
  "/"   'counsel-git-grep   ; find string in git project
  ;; bind to double key press
  "f"   '(:ignore t :which-key "files")
  "ff"  'counsel-find-file
  "fr"	'counsel-recentf
  "p"   '(:ignore t :which-key "project")
  "pf"  '(counsel-git :which-key "find file in git dir")
  )

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
    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
    "SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")

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
    (sr-speedbar highlight-parentheses sphinx-doc yasnippet py-autopep8 elpy better-defaults eink-theme company-irony flycheck-irony irony-eldoc irony flycheck python-docstring ein-mumamo which-key use-package latex-pretty-symbols ipython general ein counsel avy))))
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
(use-package irony :ensure t)
(use-package irony-eldoc :ensure t)
(use-package flycheck-irony :ensure t)
(use-package company-irony :ensure t)

;; =============
;; irony-mode
;; =============
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;; =============
;; company mode
;; =============
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
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
;; =============
;; flycheck-mode
;; =============
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; =============
;; eldoc-mode
;; =============
(add-hook 'irony-mode-hook 'irony-eldoc)
;; ==========================================
;; (optional) bind TAB for indent-or-complete
;; ==========================================
(defun irony--check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))
(defun irony--indent-or-complete ()
  "Indent or Complete"
  (interactive)
  (cond ((and (not (use-region-p))
              (irony--check-expansion))
         (message "complete")
         (company-complete-common))
        (t
         (message "indent")
         (call-interactively 'c-indent-line-or-region))))
(defun irony-mode-keys ()
  "Modify keymaps used by `irony-mode'."
  (local-set-key (kbd "TAB") 'irony--indent-or-complete)
  (local-set-key [tab] 'irony--indent-or-complete))
(add-hook 'c-mode-common-hook 'irony-mode-keys)

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
(add-to-list 'load-path "~/matlab-emacs-src")
(load-library "matlab-load")
;; Enable CEDET feature support for MATLAB code. (Optional)
(matlab-cedet-setup)

(use-package exec-path-from-shell :ensure t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(use-package ace-window :ensure t)
(global-set-key (kbd "M-o") 'ace-window)
