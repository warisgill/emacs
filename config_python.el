;5202;0c;; init.el --- Emacs configuration

;; Emacs Python Setup
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy ;;Python: adding elpy package for python 
    flycheck;;Python: adding flycheck package for python syntax checking
    ein ;; Python: add the ein package (Emacs ipython notebook)
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

;;(setq inhibit-startup-message t) ;; hide the startup message

(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(tool-bar-mode -1)
(menu-bar-mode -1)

;;  Python Configuration
;; ----------------------------------------
(elpy-enable);;Python:enabling elpy package
;;(elpy-use-ipython);; Python: for jupyter notebook
;; Python: Not sure whats its do,,, but it has some use related to jupyternotebook
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;;Python: use flycheck not flymake with elpy 
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;Python: enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; init.el ends here
