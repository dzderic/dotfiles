;; Require 'hippie-expand or everything dies
(require 'hippie-exp)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Packages to be installed:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings
                      starter-kit-js starter-kit-ruby starter-kit-eshell
                      color-theme-solarized markdown-mode ssh-config-mode
                      puppet-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Enable solarized and make it work
(load-theme 'solarized-dark t)
(custom-set-faces
 '(esk-paren-face ((t (:foreground "red")))))

;; Mapping of various file extensions to modes
(add-to-list 'auto-mode-alist '("\.pp$" . puppet-mode))

;; make flyspell easy
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "<f8>") 'flyspell-check-previous-highlighted-word)

;; make org-mode awesome
(setq org-log-done 'time)
(setq org-todo-keywords '((sequence "TODO" "PROGRESS" "DONE")))
(setq org-todo-keyword-faces '(("PROGRESS" . (:foreground "yellow"))))
