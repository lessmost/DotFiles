;; My personal emacs config file

					; screen-256color term
					;(define-key input-decode-map "^[[1;3D]" (kbd "M-<left>"))
					;(define-key input-decode-map "^[[1;3C]" (kbd "M-<right>"))
					;(define-key input-decode-map "^[[1;3B]" (kbd "M-<down>"))
					;(define-key input-decode-map "^[[1;3A]" (kbd "M-<up>"))


;; General Options
(global-font-lock-mode t)		; global syntex enable
(auto-image-file-mode t)		; show image auto
(column-number-mode t)			; show column number in mode line
(line-number-mode t)			; show line number in mode line
(global-linum-mode 1)			; show line number in buffer
(setq linum-format "%d ")		; set linum format
(show-paren-mode t)			; match
(defalias 'yes-or-no-p 'y-or-n-p)
(scroll-bar-mode -1)			; disable scroll bar
(tool-bar-mode -1)			; disable tool bar
(setq x-select-enable-clipboard t)	; enable clipboard
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq frame-title-format "%b")		; show buffer name in caption
                                        ;(setq default-fill-column 72)		; 72 column in auto fill mode
(setq auto-fill-mode 1)			; enable auto fill mode
(global-set-key (kbd "C-c f") 'auto-fill-mode)	; C-a f toggle auto-fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
                                        ;(global-set-key (kbd "TAB") 'self-insert-command)	; force TAB to insert just one TAB
                                        ;(global-set-key (kbd "TAB") 'tab-to-tab-stop)	; TAB insert TABs and Space
(setq-default indent-tabs-mode nil) ; Do not use tab, only space
(setq-default tab-width 2)          ; Set tab width
(setq default-major-mode 'text-mode)


;; ... Evil: the vim layer for Emacs
(defun use-vim ()
  (add-to-list 'load-path "~/.emacs.d/thirdparty/evil")
  (require 'evil)
  (evil-mode 1)
  )
(use-vim)

;;; backup config
(setq backup-directory-alist (quote (("." . "~/.backup/emacs"))))	; backup dir
(setq delete-old-versions t)		; auto delete old backup files
(setq kept-new-versions 6)		; keep 6 new backups
(setq kept-old-versions 2)		; keep 2 old backups
(setq versions-control t)		; enable versions backup
(add-to-list 'load-path "~/.emacs.d/thirdparty/")

;; settings for view mode
(defun my-view-mode ()
  (set viper-toggle-key "C-`")
  (setq view-read-only t)               ; use view-mode for unwritable file
					;(define-key view-map "n" 'next-line)
					;(define-key view-map "p" 'previous-line)
					;(define-key view-map "f" 'forward-char)
					;(define-key view-map "b" 'backward-char)
					;(define-key view-map "a" 'move-beginning-of-line)
					;(define-key view-map "e" 'move-end-of-line)
  )
(my-view-mode)

;; open file in last place
(defun my-saveplace ()
  (require 'saveplace)
  (setq-default save-place t)
  )
(my-saveplace)

;; uniquify
(defun my-uniquify ()
  (setq uniquify-min-dir-content 1)
  (setq uniquify-buffer-name-style 'forward)
  (require 'uniquify)
  )
(my-uniquify)

;;; custom the mode-line
(defun my-mode-line ()
  (setq-default mode-line-format
                (list
                 ;; buffer state
                 mode-line-modified
                 " ["
                 ;; buffer name
					;"%b "
                 mode-line-buffer-identification
                 "] "
                 ;; position
                 mode-line-position
                 ;; major mode & minor mode
                 mode-line-modes
                 ;; which-func
                 ;; which-func-mode
                 ;; global-mode-string
                 global-mode-string
                 )
                )
  )
(my-mode-line)
					;(setq-default mode-line-mule-info nil)

;;; spell check
;;; use M-x flyspell to toggle it
                                        ;(setq ispell-process-directory (expand-file-name "~/.emacs.d"))
(setq ispell-program-name "hunspell")
(require 'rw-language-and-country-codes)
(require 'rw-ispell)
(require 'rw-hunspell)
(setq ispell-dictionary "en_US_hunspell")
(custom-set-variables
 '(rw-hunspell-default-dictionary "en_US_hunspell")
 '(rw-hunspell-dicpath-list (quote ("/usr/share/hunspell")))
 '(rw-hunspell-make-dictionary-menu t)
 '(rw-hunspell-use-rw-ispell t)
 )

;;(require 'w3m)

;;; ido-mode
(require 'ido)
(ido-mode t)				; global enable ido mode

;;; org-mode
(require 'org-install)
(require 'org-latex)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Show empty line between subtrees even if there is only one blank line
(setq org-cycle-separator-lines 1)
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode 1)
                                        ;(setq fill-column 72)
            (auto-fill-mode 1)
            ))
;; LaTeX export for Org-mode
;; Using Listings in LaTeX export of Org-mode
(setq org-export-latex-listings t)
(setq org-export-latex-listings-options
      '(
        ("frame" "shadowbox")
        ("commentstyle" "\\color{red!50!green!50!blue!50}")
        ("rulesepcolor" "\\color{red!20!green!20!blue!20}")
        ("keywordstyle" "\\color{blue!90}\\bfseries")
        ("showstringspaces" "false")
        ("stringstyle" "\\ttfamily")
        ("keepspaces" "true")
        ("breakindent" "22pt")
        ("numbers" "left")
        ("stepnumber" "1")
        ("numberstyle" "\\tiny")
        ("basicstyle" "\\footnotesize")
        ("showspaces" "false")
        ("flexiblecolumns" "true")
        ("breaklines" "true")
        ("breakautoindent" "true")
        ("breakindent" "4em")
        ("aboveskip" "1em")
        ("fontadjust")
        ("captionpos" "t")
        ("framextopmargin" "2pt")
        ("framexbottommargin" "2pt")
        ("abovecaptionskip" "-3pt")
        ("belowcaptionskip" "3pt")
        ("xleftmargin" "4em")
        ("xrightmargin" "4em")
        ("extendedchars" "false")
        ("columns" "flexible")
        ("numbersep" "1em")
        ("tabsize" "2")
        ))
;; xelatex
(setq org-latex-to-pdf-process
      '("xelatex -interaction nonstopmode %f"
        "xelatex -interaction nonstopmode %f"))
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
;; CN Article
(add-to-list 'org-export-latex-classes
             '("cn-article"
               "\\documentclass[c5size, adobefonts]{ctexart}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{amssymb}
\\usepackage{listings}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,linkcolor=blue,menucolor=blue]{hyperref}
\\hypersetup{unicode=true}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")
))
;; CN beamer
(add-to-list 'org-export-latex-classes
             '("cn-beamer"
               "\\documentclass{beamer}
\\usepackage[adobefonts]{ctex}
\\usetheme{{{{beamertheme}}}}
\\usecolortheme{{{{beamercolortheme}}}}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,linkcolor=blue,menucolor=blue]{hyperref}
\\hypersetup{pdfpagemode=FullScreen}
\\usepackage{color}
\\usepackage{listings}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{latexsym}
\\usepackage{marvosym}
\\usepackage{amssymb}
\\tolerance=1000
\\institute{{{{beamerinstitute}}}}
\\subject{{{{beamersubject}}}}
\\setbeameroption{show notes}
\\setbeamertemplate{frametitle}[default][center]
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

;(require 'org-annotate-file)
;(global-set-key (kbd "C-c C-l") 'org-annotate-file)

;; Org2blog http://github.com/punchagan/org2blog
;;{[.FT&NLqi{*
;;5J~GwMppD7TI
(defun my-org2blog-config ()
  (require 'org2blog-autoloads)
  (setq org2blog/wp-blog-alist
        '(("my-blog"
           :url "http://blog.zqlu.info/xmlrpc.php"
           :username "zqlu"
           )))
  )
(my-org2blog-config)

;;; annot: Global annotation manager for GNU Emacs
;;; http://code.google.com/p/annot
(defun my-annot-config ()
  (setq load-path (cons "~/.emacs.d/thirdparty/annot/src/" load-path))
  (require 'annot)
  (define-key ctl-x-map "q"    'annot-remove)
  )
(my-annot-config)

;;;OrgAnnotateFile
(defun my-organnotate-config ()
  (require 'org-annotate-file)
  (global-set-key (kbd "C-c C-l") 'org-annotate-file))
					;(my-organnotate-config)

;;;Deft for note taking
(defun my-deft-config ()
  (require 'deft)
  (setq
   deft-extension "org"
   deft-directory "~/data/Dropbox/deft/"
   deft-text-mode 'org-mode)  
  (global-set-key (kbd "<f8>") 'deft))
(my-deft-config)

;;; git; installed by git in /usr/share/site-lisp
(require 'git)

;;; tramp, remote access
(require 'tramp)
(setq tramp-default-method "ssh")

;; display time
					;(setq display-time-24hr-format t)
					;(display-time)

;;; emacs shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; gdb
(global-set-key [f5] 'gdb)

;;; auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; cmake mode; installed by cmake in /usr/share/site-lisp
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;;; gnuplot-mode
(defun my-gnuplot-config ()
  ;;--------------------------------------------------------------------
  ;; Lines enabling gnuplot-mode

  ;; move the files gnuplot.el to someplace in your lisp load-path or
  ;; use a line like

  ;; these lines enable the use of gnuplot mode
  (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
  (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

  ;; this line automatically causes all files with the .gp extension to
  ;; be loaded into gnuplot mode
  (setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.gnuplot$" . gnuplot-mode)) auto-mode-alist))

  ;; This line binds the function-9 key so that it opens a buffer into
  ;; gnuplot mode 
  (global-set-key [(f9)] 'gnuplot-make-buffer)

  ;; end of line for gnuplot-mode
  ;;--------------------------------------------------------------------
  )
(my-gnuplot-config)


;;; set header file to use c++-mode
(defun my-cxx-mode-config ()
  (setq auto-mode-alist
        (append '(("\\.c$" . c++-mode)
                  ("\\.h$" . c++-mode))
                auto-mode-alist))
  )
;;(my-cxx-mode-config)

;;; auto-complete config
(defun my-auto-complete-config ()
  ;(add-to-list 'load-path "~/.emacs.d/thirdparty/auto-complete-1.3.1/")

					;(add-to-list 'ac-dictionary-directories "~/.emacs.d/thirdparty/auto-complete-1.3.1/dict")

  (require 'auto-complete-config)
  (ac-config-default)
  (ac-flyspell-workaround)
                                        ;(global-auto-complete-mode t)
  (add-to-list 'ac-modes 'lua-mode)
  (add-to-list 'ac-modes 'go-mode)
  (global-set-key "\M-/" 'auto-complete)
  (global-set-key "\M-\\" 'ac-stop)
  )
(defun my-auto-complete-add-semantic ()
  (setq ac-sources (append '(ac-source-semantic) ac-sources))
  )
(defun my-auto-complete-add-etags ()
  (require 'auto-complete-etags)
  (setq ac-sources (append '(ac-source-etags) ac-sources))
  )
(my-auto-complete-config)		; enable auto-complete

;;; autopair config function
(defun my-autopair-config ()
  (require 'autopair)
  (autopair-global-mode)
  )
(my-autopair-config)			; enable autopair globaly

;;; undo-tree config function
(defun my-undo-tree-config ()
  (require 'undo-tree)
  (global-undo-tree-mode)
  )
(my-undo-tree-config)			; global enable undo-tree mode

;;; tabbar tabbr-rule config functions
(defun my-tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    )))
(defun tabbar-config ()
  (setq EmacsPortable-global-tabbar 't)
  (require 'tabbar-ruler)
  (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
  (global-set-key (kbd "C-c C-d") 'tabbar-forward-tab)
  (global-set-key (kbd "C-c C-a") 'tabbar-backward-tab)
  (global-set-key (kbd "C-c C-s") 'tabbar-forward-group)
  (global-set-key (kbd "C-c C-w") 'tabbar-backward-group)
  )
(defun tabbar-config-nw ()
  (require 'tabbar)
  (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
					;(global-set-key (kbd "M-<right>") 'tabbar-forward-tab)
					;(global-set-key (kbd "M-<left>") 'tabbar-backward-tab)
					;(global-set-key (kbd "M-<down>") 'tabbar-forward-group)
					;(global-set-key (kbd "M-<up>") 'tabbar-backward-group)
  (global-set-key (kbd "C-x <f3>") 'tabbar-forward-tab)
  (global-set-key (kbd "C-x <f2>") 'tabbar-backward-tab)
  ;(global-set-key (kbd "C-x <f4>") 'tabbar-forward-group)
  ;(global-set-key (kbd "C-c <f1>") 'tabbar-backward-group)

  (tabbar-mode)
  )

;;; hs-minor-mode settings: hide and show blocks
(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))
(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'sh-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)

(defun my-color-theme-config ()
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-arjen)
  )
					;(my-color-theme-config)

;;; config for windows system
(if window-system
    (progn

  ;;; set font in window-system
      (set-frame-font "PT Mono-11")     ; default font
                                        ;(set-fontset-font (frame-parameter nil 'font)
                                        ; 'unicode '("Microsoft YaHei" . "unicode-bmp"))
      (set-fontset-font "fontset-default" 'han '("Adobe Song Std" . "unicode-bmp"))

  ;;;; enable menu bar in windows system
                                        ;(menu-bar-mode 1)

  ;;;; color theme
      ;(my-color-theme-config)

  ;;;; enable tabbar-ruler in window-system
      (tabbar-config)

      )
  (progn
  ;;; Non windows system

  ;;;; disable menu bar too
    (menu-bar-mode -1)

  ;;;; enable tabbar in nw system
    (tabbar-config-nw)
    )
  )


;;; xcscope config function
(defun my-xcscope-config()
  (require 'xcscope)
  (setq cscope-do-not-update-database t)
  )
(my-xcscope-config)

;;; CEDET config function
(defun my-cedet-config ()
  (require 'cedet)
                                        ;(require 'srecode)
  (setq semantic-default-submodes
        '(
          global-semanticdb-minor-mode
          global-semantic-idle-scheduler-mode
          global-semantic-idle-summary-mode
          global-semantic-idle-completions-mode
          global-semantic-highlight-func-mode))
  (global-ede-mode 1)
                                        ;(global-srecode-minor-mode 1)
  (semantic-mode 1)
  (setq semanticdb-project-roots
        (list
         (expand-file-name "~/Clustm")
         )
        )
                                        ;(global-set-key [(control tab)] 'semantic-complete-analyze-inline-idel)
  )

;;; c/c++ mode hook functions
(defun mycc-hook()

 ;;; turn off auto-fill-mode
  (auto-fill-mode 1)

 ;;;; c/c++ code style
                                        ;(c-set-style "Google")

 ;;;; enable CEDET in c-mode c++-mode
					;(my-cedet-config)

 ;;; ecb
					;(setq stack-trace-on-error t)
					;(require 'ecb-autoloads)
					;(setq ecb-tip-of-the-day nil)		; disable tip

 ;;; add semantic to auto-complete sources
                                        ;(my-auto-complete-add-semantic)	;

 ;;; add etags to auto-complete sources
                                        ;(my-auto-complete-add-etags)

 ;;;; enable xcscope in c-mode cc-mode
                                        ;(my-xcscope-config)	; enable xcscope
  
  ;; flyspell for prog
  (flyspell-prog-mode)

  )

                                        ;(add-hook 'c++-mode-common-hook 'mycc-hook)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'mycc-hook)
(add-hook 'c-mode-common-hook
          (lambda ()
	    (auto-fill-mode 1)
	    (set (make-local-variable 'fill-nobreak-predicate)
		 (lambda ()
		   (not (eq (get-text-property (point) 'face)
			    'font-lock-comment-face))))))


;;; Doxymacs
(defun my-doxymacs-config()
  (require 'doxymacs)
  (add-hook 'c-mode-common-hook 'doxymacs-mode)
  (defun my-doxymacs-font-lock-hook ()
    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
	(doxymacs-font-lock)))
  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
  )
(my-doxymacs-config)


;;; Ask before exit
(defun ask-before-closing ()
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs?"))
      (save-buffers-kill-emacs))
  (message "Canceled exit"))
(global-set-key (kbd "C-x C-c") 'ask-before-closing)
