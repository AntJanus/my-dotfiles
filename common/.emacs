;; Basics
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

;; remove toolbars
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Font
(set-default-font "Fira Code iScript-12.0")

;; different autocompletion
(ido-mode 1)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; ibuffer instead of list-buffers
(defalias 'list-buffers 'ibuffer) ; make ibuffer default

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
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "b35a14c7d94c1f411890d45edfb9dc1bd61c5becd5c326790b51df6ebf60f402" "51ba4e2db6df909499cd1d85b6be2e543a315b004c67d6f72e0b35b4eb1ef3de" default)))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (doom-themes zerodark-theme htmlize magit ## markdown-mode org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Org-mode settings
(require 'org)
(require 'ob)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
    (js . t)
    (shell . t)
    (awk . t)
    (ruby . t)))

;; no confirmation
(setq org-confirm-babel-evaluate nil)
;; syntax highlighting
(setq org-src-fontify-natively t)
;; todo states
(setq org-todo-keywords
  '((sequence "TODO" "IN PROGRESS" "|" "DONE" "ABANDONED")))

;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; file to save to do items
(setq org-agenda-files (quote ("~/Dropbox/notes/daily-todo.org")))

;; set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)


;; open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;; capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/Dropbox/notes/daily-todo.org" "Today")
	 "* TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")))

;; Abbreviations
(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(
    ("atm" "at the moment")
  ))

;; Set initial screen to bookmark list
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")

;; word wrap:
(global-visual-line-mode t)
