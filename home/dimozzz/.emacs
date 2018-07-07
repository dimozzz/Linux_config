(load "~/.emacs_config/auctex.el")
(set-language-environment 'UTF-8)
(setq default-input-method 'russian-computer)
(global-set-key [f13] 'toggle-input-method)

;; Turn on tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; Bind the TAB key 
;(global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "TAB") 'tab-to-tab-stop)


;; Set the tab width
(setq default-tab-width 4)
(setq-default tab-width 4)
(setq tab-width 4)
(setq-default c-basic-indent 4)
(setq c-basic-indent 4)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-linum-mode t)

(setq-default fill-column 105)

(setq make-backup-files nil)
(setq auto-save-default nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
