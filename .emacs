;; Basics
(setq inhibit-startup-screen t)

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

;; spell check
(defun my-turn-spell-checking-on ()
  "Turn flyspell-mode on."
  (flyspell-mode 1)
  )

(add-hook 'text-mode-hook 'my-turn-spell-checking-on)

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
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages (quote (htmlize magit ## markdown-mode org))))
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
    (awk . t)
    (ruby . t)))

;; no confirmation
(setq org-confirm-babel-evaluate nil)
;; syntax highlighting
(setq org-src-fontify-natively t)
;; todo states
(setq org-todo-keywords
  '((sequence "TODO" "IN PROGRESS" "|" "DONE")))

;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; file to save to do items
(setq org-agenda-files (quote ("E:/Dropbox/notes/agenda-todo.org")))

;; set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)


;; open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;; capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "E:/Dropbox/notes/agenda-todo.org" "Tasks")
	 "* TODO [#A] %?")))

;; Abbreviations
(clear-abbrev-table global-abbrev-table)

(define-abbrev-table 'global-abbrev-table
  '(
    ("atm" "at the moment")

  ))

;; Set initial screen to bookmark list
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")

;;::::: small tweaks

;; word wrap:
(global-visual-line-mode t)
