(set-language-environment 'UTF-8)
(setq default-input-method 'russian-computer)
(global-set-key [f13] 'toggle-input-method)

;; Turn on tabs
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)

;; Bind the TAB key 
(global-set-key (kbd "TAB") 'self-insert-command)

;; Set the tab width
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)

(global-set-key (kbd "RET") 'newline-and-indent)
;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)
