(load "auctex.el" nil t t)
(load "preview.el" nil t t)


(setq TeX-parse-self t)
(setq TeX-auto-save nil)


(define-key LaTeX-mode-map [remap fill-region] 'LaTeX-fill-region)
(define-key LaTeX-mode-map [remap fill-paragraph] 'LaTeX-fill-paragraph)


(setq-default TeX-brace-indent-level 4)
(setq-default LaTeX-indent-level 4)
(setq LaTeX-item-indent 0)



(setq TeX-newline-function 'newline-and-indent)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)


;; Don't prompt for choosing ref label style
(setq reftex-ref-macro-prompt nil)


;; Setup entry in reftex-label-alist, using all defaults for equations
(setq reftex-label-alist '((detect-multiple-label ?e nil nil nil nil)))

(defun detect-multiple-label (bound)
  "Reftex custom label detection. When using conditionnal compilation in latex with, for example, \\ifCLASSOPTIONonecolumn
  labels might have to be defined multiple times. We factor out that definition with \\def\onelabel{\\label{eq:22}} and use it
  mutiple times."
  (if (re-search-backward "label{\\\\label{" bound t) (point)))


(defun latex-auto-fill-everywhere ()
  (when comment-auto-fill-only-comments
    (set (make-local-variable 'comment-auto-fill-only-comments)
         nil)))

(add-hook 'LaTeX-mode-hook 'latex-auto-fill-everywhere)


(defun LaTeX-indent-item ()
  (save-match-data
    (let* ((offset LaTeX-indent-level)
           (contin (or (and (boundp 'LaTeX-indent-level-item-continuation)
                            LaTeX-indent-level-item-continuation)
                       (* 2 LaTeX-indent-level)))
           (re-beg "\\\\begin{")
           (re-end "\\\\end{")
           (re-env "\\(itemize\\|\\enumerate\\|\\enumtask\\|\\itemtask\\|\\enumcyr\\|description\\)")
           (indent (save-excursion
                     (when (looking-at (concat re-beg re-env "}"))
                       (end-of-line))
                     (LaTeX-find-matching-begin)
                     (current-column))))
      (cond ((looking-at (concat re-beg re-env "}"))
             (or (save-excursion
                   (beginning-of-line)
                   (ignore-errors
                     (LaTeX-find-matching-begin)
                     (+ (current-column)
                        (if (looking-at (concat re-beg re-env "}"))
                            contin
                          offset))))
                 indent))
            ((looking-at (concat re-end re-env "}"))
             indent)
            ((looking-at "\\\\item")
             (+ offset indent))
            (t
             (+ contin indent))))))

(defcustom LaTeX-indent-level-item-continuation 8
  "*Indentation of continuation lines for items in itemize-like environments."
  :group 'LaTeX-indentation
  :type 'integer)

(eval-after-load "latex"
  '(setq LaTeX-indent-environment-list
         (nconc '(("itemize" LaTeX-indent-item)
                  ("enumerate" LaTeX-indent-item)
		  ("enumcyr" LaTeX-indent-item)
		  ("enumtask" LaTeX-indent-item)
		  ("itemtask" LaTeX-indent-item)
                  ("description" LaTeX-indent-item))
                LaTeX-indent-environment-list)))
