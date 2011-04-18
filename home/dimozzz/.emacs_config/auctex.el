(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

 	
(setq TeX-auto-save nil)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq LaTeX-indent-level 4)
(setq LaTeX-item-indent 4)
(setq TeX-newline-function 'newline-and-indent)

(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)