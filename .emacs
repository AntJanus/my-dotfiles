(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default))))
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
(setq required-pkgs '(better-defaults web-mode markdown-mode js2-mode json-mode ac-js2 auto-complete yasnippet sublime-themes flycheck flycheck-pos-tip powerline evil powerline-evil evil-leader project-explorer projectile badwolf-theme editorconfig scss-mode less-css-mode php-mode elm-mode))

(require 'cl)

(setq pkgs-to-install
      (let ((uninstalled-pkgs (remove-if 'package-installed-p required-pkgs)))
        (remove-if-not '(lambda (pkg) (y-or-n-p (format "Package %s is missing. Install it? " pkg))) uninstalled-pkgs)))

(when (> (length pkgs-to-install) 0)
  (package-refresh-contents)
  (dolist (pkg pkgs-to-install)
    (package-install pkg)))

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

;;Javascript
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; Flycheck syntax checking
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))


(flycheck-add-mode 'javascript-eslint 'javascript-mode)

(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))


;; web mode
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;; scss
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'". scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'". scss-mode))

;; less
(require 'less-css-mode)
(add-to-list 'auto-mode-alist '("\\.less\\'". less-css-mode))

;; php mode
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'". php-mode))

;; hooks
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

;; set theme
(load-theme 'badwolf t)
(powerline-evil-vim-color-theme)
(display-time-mode t)
(global-linum-mode)

;; shortcuts
(define-key global-map (kbd "RET") 'newline-and-indent)

;; projectile setup
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)

;; project explorer
(require 'project-explorer)

;; evil mode
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "v" 'split-window-right)
(evil-leader/set-key "t" 'projectile-find-file)
(evil-leader/set-key "f" 'project-explorer-open)

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

