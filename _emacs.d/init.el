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
                      color-theme-solarized markdown-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'solarized-dark t)

(custom-set-faces
 '(esk-paren-face ((t (:foreground "red")))))
