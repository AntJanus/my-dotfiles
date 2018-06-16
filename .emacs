;; use C-x for cut
;; C-c for copy
;; C-v for paste

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(cua-mode 1)

;; spell check
(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )

(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

;; ibuffer instead of list-buffers
(defalias 'list-buffers 'ibuffer) ; make ibuffer default

;; Set initial screen to bookmark list
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")

;; track recently opened files
(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)

;; MELPA package support
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://stable.melpa.org/packages/")
   t))

;; Packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (markdown-mode org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
