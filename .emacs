(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; store all backup files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; load my dark theme!
(load-theme 'dracula t)

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

;; auto new line when going down
(setq next-line-add-newlines t)



