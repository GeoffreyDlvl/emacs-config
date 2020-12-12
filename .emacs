;; Make MELPA repository available
(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; Auto download required packages
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

; dracula-theme
(use-package dracula-theme
  :ensure dracula-theme)


;; load my dark theme!
(load-theme 'dracula t)


;; store all backup files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))


;; Interactively DO things
(require 'ido)
(ido-mode 1)


;; custom commands 
(require 'recentf)
; get rid of `find-file-read-only' and replace it with something
; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
; enable recent files mode.
(recentf-mode t)
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


(define-key global-map "\M-o" 'other-window)


;; no tabs
(setq-default indent-tabs-mode nil)

;; fix indentation style for c/c++
(defun my-c++-mode-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
  (c-set-offset 'case-label '+)
  (c-set-offset 'statement-case-open 0)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; auto new line when going down
(setq next-line-add-newlines t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (dracula-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
