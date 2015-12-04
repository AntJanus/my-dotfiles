(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Package sources
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; packages
(setq required-pkgs '(markdown-mode js2-mode ac-js2 yasnippet auto-complete sublime-themes flycheck flycheck-pos-tip powerline evil powerline-evil))

(require 'cl)

(setq pkgs-to-install
      (let ((uninstalled-pkgs (remove-if 'package-installed-p required-pkgs)))
        (remove-if-not '(lambda (pkg) (y-or-n-p (format "Package %s is missing. Install it? " pkg))) uninstalled-pkgs)))

(when (> (length pkgs-to-install) 0)
  (package-refresh-contents)
  (dolist (pkg pkgs-to-install)
    (package-install pkg)))

;;; evil mode

;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas/initialize)

;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-yasnippet))
(setq ac-auto-start 2)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; Flycheck syntax checking
(require 'flycheck)
(global-flycheck-mode)

(flycheck-add-mode 'javascript-eslint 'javascript-mode)

(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))

;;Javascript
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;; hooks
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

;; set theme
(load-theme 'graham t)
(powerline-evil-vim-color-theme)
(display-time-mode t)

;; shortcuts
(define-key global-map (kbd "RET") 'newline-and-indent)
