(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'dired-mode-hook 'auto-revert-mode)

;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

(global-visual-line-mode 1)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(setq scroll-margin 5
      scroll-preserve-screen-position 1)

(setq-default frame-title-format '((:eval (if (buffer-file-name)
                                              (abbreviate-file-name (buffer-file-name)) "%f"))))

(scroll-bar-mode -1) ;; Disables the scroll bar
(setq large-file-warning-threshold nil) ;; Don't warm me about opening large files
(setq x-select-enable-clipboard t) ;; Enable copy/past-ing from clipboard
(fset 'yes-or-no-p 'y-or-n-p) ;; Answer with y and n instead of yes or no
(global-auto-revert-mode 1) ;; Always reload the file if it changed on disk
(setq-default line-spacing 1) ;; A nice line height

(set-fringe-mode '(10 . 0)) ;; Show a nice fringe

;; Remove the fringe indicators
(when (boundp 'fringe-indicator-alist)
  (setq-default fringe-indicator-alist
		'( (continuation . nil)
		   (overlay-arrow . nil)
		   (up . nil)
		   (down . nil)
		   (top . nil)
		   (bottom . nil)
		   (top-bottom . nil)
		   (empty-line . nil)
		   (unknown . nil))))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-auto-pairing nil)
(setq web-mode-enable-auto-closing nil)
(setq web-mode-enable-auto-quoting nil)

(add-hook 'lisp-mode-hook '(lambda ()
			     (local-set-key (kbd "RET") 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.cs?\\'" . csharp-mode))

(setq visible-bell 1)

(setq ring-bell-function 'ignore)

(tool-bar-mode -1)

(menu-bar-mode -1)
