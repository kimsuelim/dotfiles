;; Time-stamp: <2010-07-23 Fri 12:21:56 Joshua Kim>

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/ruby-mode")
(add-to-list 'load-path "~/.emacs.d/org")       ; 5.04
(add-to-list 'load-path "~/.emacs.d/yasnippet") ; 0.6.1c
(add-to-list 'load-path "~/.emacs.d/tramp") ; 2.1.14
(add-to-list 'load-path "~/.emacs.d/w3m")   ; cvs_version_09_07_23
(add-to-list 'load-path "~/.emacs.d/Emacs-PDE-0.2.16/lisp")
(add-to-list 'load-path "~/.emacs.d/color-theme/") ; 6.6.0
(add-to-list 'load-path "~/.emacs.d/twilight-emacs")
;;(add-to-list 'load-path "/opt/local/share/emacs/23.2/lisp")
(add-to-list 'load-path "/Applications/Aquamacs.app/Contents/Resources/lisp")

(push "/opt/local/bin" exec-path)

(load "my-custom.el")
;;(load "my-mew.el")
;;(load "my-w3m.el")
;;(load "my-auctex.el")

(setq bookmark-default-file "/.emacs.d/.emacs.bmk")
(setq custom-file "~/.emacs.d/my-custom.el")
(setq gnus-init-file "~/.emacs.d/my-gnus.el")
;; (setq abbrev-file-name "~/.emacs.d/abbrev_defs")

;; Easier Window Switching in Emacs
;(windmove-default-keybindings 'meta)
(global-set-key [(meta ctrl up)]    'windmove-up)
(global-set-key [(meta ctrl down)]  'windmove-down)
(global-set-key [(meta ctrl left)]  'windmove-left)
(global-set-key [(meta ctrl right)] 'windmove-right)


;; This is an enhancement of shell-command, shell-command-on-region,
;; grep, grep-find, and compile, that enables tab-completion of
;; commands and dir/filenames within their input contexts.
(require 'shell-command)
(shell-command-completion-mode)

;; sudo-save.el is a quick package to save files as root on the local
;; box. If you have ‘sudo’ installed and you have permission to edit
;; files (and can cache passwords) then Emacs will run chmod on the
;; file before and after you save it.
(require 'sudo-save)

(require 'etags-table)
(setq tag-table-alist 
      '(("~/.emacs.d/" . "~/.emacs.d/TAGS")
        ("~/projects/source/" . "~/.TAGS/projects.tags")))
(setq etags-table-alist tag-table-alist)
(setq etags-table-search-up-depth 10)

(require 'etags-select)
;;binding the key
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
    (defun find-tags-file-r (path)
      "find the tags file from the parent directories"
      (let* ((parent (file-name-directory path))
             (possible-tags-file (concat parent "TAGS")))
        (cond
         ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
         ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
         (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it 
          (find-tags-file-r (buffer-file-name)))
      (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (setq tags-table-list (list (jds-find-tags-file))))

;; delay search the TAGS file after open the source file
(add-hook 'emacs-startup-hook 
          '(lambda () (jds-set-tags-file-path)))


(require 'xcscope)
;; For example, the following will add "C-f#" keybindings, which
;; are easier to type than the usual "C-c s" prefixed keybindings.  Note
;; that specifying "global-map" instead of "cscope:map" makes the
;; keybindings available in all buffers:
;;
;; (define-key global-map [(control f3)]  'cscope-set-initial-directory)
;; (define-key global-map [(control f4)]  'cscope-unset-initial-directory)
;; (define-key global-map [(control f5)]  'cscope-find-this-symbol)
;; (define-key global-map [(control f6)]  'cscope-find-global-definition)
;; (define-key global-map [(control f7)]
;;   'cscope-find-global-definition-no-prompting)
;; (define-key global-map [(control f8)]  'cscope-pop-mark)
;; (define-key global-map [(control f9)]  'cscope-next-symbol)
;; (define-key global-map [(control f10)] 'cscope-next-file)
;; (define-key global-map [(control f11)] 'cscope-prev-symbol)
;; (define-key global-map [(control f12)] 'cscope-prev-file)
;; (define-key global-map [(meta f9)]  'cscope-display-buffer)
;; (defin-ekey global-map [(meta f10)] 'cscope-display-buffer-toggle)

;; This line only if org-mode is not part of the X/Emacs distribution.
(require 'org-install)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook
          '(lambda ()
             (auto-fill-mode)
             (longlines-mode nil)
             (setq org-log-done t)
             (local-set-key "\C-cl" 'org-store-link)
             (local-set-key "\C-ca" 'org-agenda)))
(setq org-log-done t)
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)

;; psvn
(require 'psvn)
(setq svn-status-default-log-0arguments "--verbose")

;; nxhtml
(load "~/.emacs.d/nxhtml/autostart.el")
(load "autostart.el")

;; css mode
(setq cssm-indent-level 4)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode nil)

(defun indent-buffer ()
    (interactive)
    (save-excursion (indent-region (point-min) (point-max) nil))
)

;; tramp
(require 'tramp)
;; (setq tramp-default-user "root")
(setq tramp-default-method "plink")
;; (setq tramp-default-user "joshua"
;;       tramp-default-host "cs2.knu.ac.kr")

; iman for info pages
(autoload 'iman "iman"
  "Call the viewers of man pages and GNU Info with completion."
  t nil)
(global-set-key "\C-cm" 'iman) ; `control c', then `m' calls `iman'
(setq iman-Man-index-command-and-args '("man" "-k" "[a-z]"))
;; (add-to-list 'Info-default-directory-list "~/emacs/tramp/info/")
(setq Info-default-directory-list
      (append '("c:/cygwin/usr/share/info"
                "~/.emacs.d/ecb/info-help"
                "~/.emacs.d/info")
              Info-default-directory-list))
; woman
(setq woman-use-own-frame nil)

; menu-bar+
;;(eval-after-load "menu-bar" '(require 'menu-bar+))
 
; smart-compile
(require 'smart-compile)
(global-set-key "\C-c\C-c" 'smart-compile)
(global-set-key [(meta f7)] 'smart-compile)
(define-key menu-bar-tools-menu [compile] '("Compile..." . smart-compile))

; smart-dnd.el
(require 'smart-dnd)
(add-hook
 'html-mode-hook
 (lambda ()
   (smart-dnd-setup
    '(
      ("\\.gif\\'" . "<img src=\"%R\">\n")
      ("\\.jpg\\'" . "<img src=\"%R\">\n")
      ("\\.png\\'" . "<img src=\"%R\">\n")
      ("\\.css\\'" . "<link rel=\"stylesheet\" type=\"text/css\" href=\"%R\">\n" )
      ("\\.js\\'"  . "<script type=\"text/javascript\" src=\"%R\"></script>\n" )
      (".*" . "<a href=\"%R\">%f</a>\n")
      ))))

; autoinsert.el
(require 'autoinsert)
(setq auto-insert-directory "~/.emacs.d/lib/")
(setq auto-insert-alist
      (append '(
                ("\\.c$" . "template.c")
                ("\\.f$" . "template.f")
                ) auto-insert-alist))

(add-hook 'find-file-not-found-hooks 'auto-insert)
; cedet 1.0pre7
(load-file "~/.emacs.d/cedet/common/cedet.el")
;; (load "cedet")
;; (require 'cedet)
;; Enable EDE (Project Management) features
;; (global-ede-mode 1)
;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-guady-code-helpers)

;; Enables which-func-mode, that shows name of current function in status line
;; (semantic-load-enable-excessive-code-helpers)

;;  Enables several modes, that are useful when you debugging
;;  Semantic displaying of parsing errors, its state, etc.
;; (semantic-load-enable-semantic-debugging-helpers)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;(require 'semantic-ia)
;;(require 'semantic-gcc)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(require 'semanticdb)
(setq semanticdb-default-save-directory "~/.emacs.d/#semanticdb.cache#")
(global-semanticdb-minor-mode 1)

;; Explicitly specify additional paths for look up of include files
;; (semantic-add-system-include "~/exp/include/boost_1_37" 'c++-mode)
;; (semantic-add-system-include "~/exp/include" 'c++-mode)
;; (semantic-add-system-include "~/exp/include" 'c-mode)

;; (setq boost-base-directory "~/exp/include/boost-1_40/")
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;;              (concat boost-base-directory "/boost/config.hpp"))

;; gnu global support
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;; Enable ctags for some languages: Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(semantic-load-enable-primary-exuberent-ctags-support)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)

  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)

;; For C-like languages, user can use the semantic-complete-self-insert
;; command, bound to the . and/or > keys, as this show below:
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)

  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; ASM Mode
(add-to-list 'auto-mode-alist '("\\.[sS]$" . asm-mode))

; ecb-2.32
(add-to-list 'load-path "~/.emacs.d/ecb")
;; (require 'ecb)
(require 'ecb-autoloads)

;; Using mouse left and right button
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-tip-of-the-day nil)

;; log keyboard commands to buffer
(load "mwe-log-commands.el")
(add-hook 'LaTeX-mode-hook (function mwe:log-keyboard-commands))
(add-hook 'c-mode-hook (function mwe:log-keyboard-commands))
(add-hook 'c++-mode-hook (function mwe:log-keyboard-commands))
(add-hook 'emacs-lisp-mode-hook (function mwe:log-keyboard-commands))
(add-hook 'ruby-mode-hook (function mwe:log-keyboard-commands))

;; You will need the package cygwin-mount.el in order
;; for Gnu Emacs to recognize Cygwin's path names. If you do not have this
;; package, Gnu Emacs will not understand /cygdrive/c. Put this package under
;; directory site-lisp. In my PC, the full directory name is
;; c:\programs\emacs\site-lisp. After you have done that, add the following
;; lines in your .emacs file.

;; Emacs::PDE - Perl Development Environment in emacs
(load"pde-load")

;; cperl-mode is preferred to perl-mode
;; "Brevity is the soul of wit" <foo at acm.org>
(defalias 'perl-mode 'cperl-mode)
;; Alternatively, use:
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook
          (lambda ()
            (cperl-set-style "PerlStyle")
            (yas/minor-mode t)
            (setq cperl-hairy t)
            (setq cperl-auto-newline nil)
            (local-set-key "\C-j" 'newline-and-indent)
            (local-set-key [return] 'newline-and-indent)))
;; 4 space indents in cperl mode
;; (setq cperl-close-paren-offset -4)
;; (setq cperl-continued-statement-offset 4)
;; (setq cperl-indent-level 4)
;; (setq cperl-indent-parens-as-block t)
;; (setq cperl-tab-always-indent t)

;; python mode
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

;(setq load-path (cons "~/.emacs.d/python-mode-1.0/" load-path))
(require 'python)

;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (set (make-variable-buffer-local 'beginning-of-defun-function)
;;                  'py-beginning-of-def-or-class)
;;             (setq outline-regexp "def\\|class ")))

;;; Ruby Mode
(autoload 'ruby-mode "ruby-mode"
      "Mode for editing ruby source files" t)

(setq auto-mode-alist
          (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake\\'" . ruby-mode) auto-mode-alist))

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")

(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             (setq comint-process-echoes t)
             (ruby-electric-mode)
             (local-set-key [return] 'newline-and-indent)
             
             ;; start completion automatically after inserting . and ::
             (add-to-list 'ac-sources 'ac-source-rsense-method)
             (add-to-list 'ac-sources 'ac-source-rsense-constant)

             ;; C-@
             ;; (local-set-key "\C- " 'ac-complete-rsense)
             
             ;; C-SPC
             (local-set-key [?\C- ] 'ac-complete-rsense)
             ))

(require 'ruby-electric) 

;; auto-complete-1.2
(add-to-list 'load-path "~/.emacs.d/auto-complete")
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;; Replace $RSENSE_HOME with the directory where RSense was installed in full path
(setq rsense-home "/usr/local/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; gdb
;; (defun my-gud-style ()
;;   (load "gud")
;;   (local-set-key [f5] 'gud-run)
;;   (local-set-key [f6] 'gud-cont)
;;   (local-set-key [f7] 'tmm-menubar)
;;   (local-set-key [f8] 'gud-remove)
;;   (local-set-key [f9] 'gud-break)
;;   (local-set-key [f11] 'gud-step)
;;   (local-set-key [f12] 'gud-finish))

;; (add-hook 'gdb-mode-hook 'my-gud-style)
;; (add-hook 'c-mode-hook 'my-gud-style)
;; (add-hook 'c++-mode-hook 'my-gud-style)

;; define C/C++ mode style
(defun my-c-mode-hook ()
  (interactive)
  (c-set-offset 'arglist-intro '++)
  (linum-mode 1)
  (local-set-key "\C-j" 'newline-and-indent)
  ;(local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-c\C-c" 'smart-compile)
  (c-set-style "stroustrup")
;;   (c-toggle-auto-newline -1)
;;   (c-toggle-auto-state 1)
  (c-toggle-hungry-state 1)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  ;(flymake-mode)
  (setq viper-auto-indent nil))

(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil) ;;  only use space for tab
(setq c-basic-offset 4)

;;---------------------------------------------------------- 
;; if you encounter a file with ^M or ... at the end of every line, this means a
;; wrong copy by samba or floppy disk of the DOS file to UNIX.  get rid of them
(global-set-key [f5] 'cut-ctrlM) ; cut all ^M.
(defun cut-ctrlM ()
  "Cut all visible ^M."
  (interactive)
  (beginning-of-buffer)
  (while (search-forward "\r" nil t)
    (replace-match "" nil t)))

;; move lines up and down
(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down) 

(defun move-line (&optional n)
 "Move current line N (1) lines up/down leaving point in place."
 (interactive "p")
 (when (null n)
    (setq n 1))
 (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))

(defun move-line-up (n)
 "Moves current line N (1) lines up leaving point in place."
 (interactive "p")
 (move-line (if (null n) -1 (- n)))) 

(defun move-line-down (n)
 "Moves current line N (1) lines down leaving point in place."
 (interactive "p")
 (move-line (if (null n) 1 n)))

; copy current line
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
   (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
   (line-beginning-position 2)))))

(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
;; Always end searches at the beginning of the matching expression.
(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
    (when isearch-forward (goto-char isearch-other-end)))

; lide vi editor's CTRL-o
(global-set-key [(control o)] 'vi-open-next-line)
(defun vi-open-next-line (arg)
 "Move to the next line (like vi) and then opens a line."
 (interactive "p")
 (end-of-line)
 (open-line arg)
 (next-line 1)
 (indent-according-to-mode))

(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; like vim mark option,use key C-. and C-,
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.  Use
ska-jump-to-register to jump back to the stored position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position vthat was
stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
 (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;; go-to-char
(define-key global-map (kbd "C-c c") 'wy-go-to-char)
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char) char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;; --------------------------------------------------------------------
;; hide block
;; For Emacs 20:

;;     * C-c S show all
;;     * C-c H hide all
;;     * C-c s show block
;;     * C-c h hide block

;; For Emacs 21:

;;     * C-c @ ESC C-s show all
;;     * C-c @ ESC C-h hide all
;;     * C-c @ C-s show block
;;     * C-c @ C-h hide block
;;     * C-c @ C-c toggle hide/show
(load-library "hideshow")
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)

;;longlines.el
(autoload 'longlines-mode
  "longlines.el"
  "Minor mode for automatically wrapping lone lines." t)

; yasnippet-bundle-0.6.1c
(require 'yasnippet)
(yas/initialize)
(setq yas/extra-mode-hooks '(the-major-mode))
(yas/load-directory "~/.emacs.d/yasnippet/snippets")
(yas/define-snippets 'nxhtml-mode nil 'html-mode)

; if TAB expand doesn't work
(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))

(yas/advise-indent-function 'ruby-indent-line)

;; display line numbers
(require 'linum)
(global-linum-mode 1)

;; highlight current line
(require 'hl-line+)
(toggle-hl-line-when-idle 1) ; Highlight only when idle, default mode
(hl-line-when-idle-interval 2) ; number of idle seconds to wait before
                               ; highlighting.

;; session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; desktop.el
;; save a list of open files in ~/.emacs.desktop
;; save the desktop file automatically if it already exists
(setq desktop-save 'if-exists)
(desktop-save-mode 1)
;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

(load "desktop")
(desktop-load-default)
(desktop-read)

;; ibuffer.el
(require 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key ibuffer-mode-map (kbd "#") 'ibuffer-switch-format)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("C" (mode . c-mode))
               ("C++" (mode . c++-mode)) 
               ("WoMan" (mode . woman-mode))
               ("info" (mode . Info-mode))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (mode . fundamental-mode)))
               ("perl" (mode . cperl-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; browse-kill-ring.el
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; htmlize.el
(require 'htmlize)

;; ctypes.el
(require 'ctypes)

;; color-theme.el
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/color-theme-dirac.el")
;(color-theme-dirac)
(load-file "~/.emacs.d/twilight-emacs/color-theme-twilight.el")
;; (color-theme-twilight)
(setq color-theme-is-global t)
;(color-theme-emacs-21)
;(color-theme-xemacs)
;(color-theme-taylor)
;(color-theme-jedit-grey)
;(color-theme-gnome2)
;(color-theme-snow)
;(color-theme-dark-laptop)
;(color-theme-tty-dark)
;(color-theme-dark-green)
;(color-theme-dark-blue2)

;; tab-display.el
;; (require 'tab-display)
;; (global-set-key (quote [f7]) (quote tab-display-mode))

;; goto-last-change
(require 'goto-last-change)

;; Texinfo fancy chapter tags
(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
(add-hook 'texinfo-mode-hook (lambda () (require 'semantic-texi)))

;; HTML fancy chapter tags
(add-hook 'html-mode-hook (lambda () (require 'sb-html)))
;(eval-after-load "info" '(require 'sb-info))

;; ido.el config
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(add-hook 'ido-setup-hook 
          (lambda () 
            (define-key ido-completion-map [tab] 'ido-complete)))

;; swbuff
(require 'swbuff-y)
(setq swbuff-exclude-buffer-regexps '("^ " "\\*.*\\*"))
(global-set-key [(control shift tab)] 'swbuff-switch-to-previous-buffer)
(global-set-key [(control tab)] 'swbuff-switch-to-next-buffer)
;; (setq swbuff-clear-delay 1) ;; set time for pop menu
;; (setq swbuff-separator "|") ;; divide words by symbol "|"

;; recentf.el
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)

(global-set-key [(meta f12)] 'recentf-open-files)
(global-set-key [(control x)(control r)] 'recentf-open-files)

;; hide region
(require 'hide-region)
(global-set-key (kbd "C-c r") 'hide-region-hide)
(global-set-key (kbd "C-c R") 'hide-region-unhide)

;; hide lines
(require 'hide-lines)
(global-set-key (kbd "C-c l") 'hide-lines)
(global-set-key (kbd "C-c L") 'show-all-invisible)

;; holding config 
(autoload 'folding-mode "folding"
"Minor mode that simulates a folding editor" t)
(load-library  "folding")

;; wirteable dired
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; w32-browser
(require 'w32-browser)
(eval-after-load "dired"
  '(define-key dired-mode-map [f4] (lambda ()
                                     (interactive)
                                     (w32-browser
                                      (dired-replace-in-string
                                       "/" "\\"
                                       (dired-get-filename))))))

;; just use one dired buffer
(require 'dired-single)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "RET") 'joc-dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>")
              'joc-dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (joc-dired-single-buffer "..")))))

;; dired config
(require 'dired+)
;; (require 'dired)
;; (require 'dired-x)
(global-set-key "\C-x\C-j" 'dired-jump) ; jump to folder that in the current file
(define-key dired-mode-map [(control ?/)] 'dired-undo)

(defun explorer-dired ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (w32-shell-execute "open" file-name nil 1))))

(setq dired-listing-switches "-avl"
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      cvs-dired-use-hook 'always)

;; --------------------------------------------------------------------------
(setq w32-pass-lwindow-to-system nil
      w32-pass-rwindow-to-system nil
      w32-pass-apps-to-system    nil
      w32-lwindow-modifier       'super   ;; Left Windows
      w32-rwindow-modifier       'super   ;; Rigth Windows
      w32-apps-modifier          'hyper)  ;; App-Menu (right to
                                           ;; Right Windows)
(global-set-key [(super g)] 'goto-line)

(define-key global-map [f12] 'wy-go-to-char)
(global-set-key [(meta f11)] 'ibuffer)
(global-set-key [(meta f10)] ' delete-other-windows)
(global-set-key [(meta f9)] 'other-window)
(global-set-key [(meta f8)] 'mwe:open-command-log-buffer)
(global-set-key "\C-h" 'backward-delete-char-untabify)
(global-set-key [f2] 'eshell)
(global-set-key [f3] 'bookmark-set)
(global-set-key [f4] 'list-bookmarks)
(global-set-key "\M-]" 'find-next-tag)
(global-set-key "\M-[" 'find-prev-tag)

(modify-coding-system-alist 'file "\\.rb$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.sh$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.py$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.rhtml$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.txt$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.tex$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.org$" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.c$" 'euc-kr-unix)
(modify-coding-system-alist 'file "\\.cpp$" 'euc-kr-unix)
(modify-coding-system-alist 'file "\\.c\\'" 'utf-8-unix)
(modify-coding-system-alist 'file "\\.cpp\\'" 'utf-8-unix)
(set-file-name-coding-system 'euc-kr)
(set-terminal-coding-system 'euc-kr)
(prefer-coding-system 'euc-kr)
;;; (set-default-coding-systems 'utf-8) 
;;; (set-terminal-coding-system 'utf-8) 
;;; (set-keyboard-coding-system 'utf-8)
;(set-default-coding-systems 'euc-kr) 
;(set-terminal-coding-system 'euc-kr) 
;(set-keyboard-coding-system 'euc-kr)

;set time-stamp
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-start "Time-stamp:[ \t]*<")
(setq time-stamp-end ">")
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S Joshua Kim")
(add-hook 'write-file-hooks 'time-stamp)
(add-hook 'save-buffer-hooks 'time-stamp)

(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . nxhtml-mode) auto-mode-alist))

;; display buffer names in top bar
;; (setq frame-title-format "Live in Emacs^^ <%b> <%f>")
(setq frame-title-format "Live in Emacs^^ | %f")

;(setq default-directory "F:/Eric-Document")
(setq next-screen-context-lines 3)      ; # of lines of overlap when scrolling
(setq scroll-preserve-screen-position t); make pgup/dn remember current line
(setq scroll-step 1)
;(setq scroll-margin 3)
(setq scroll-conservatively 10000)

(setq x-stretch-cusor t)                ;show tab character
(auto-image-file-mode)                ;; auto show image
(setq visible-bell t)                 ;; turn off bell
(setq kill-ring-max 200)              ;; use big kill ring
(setq inhibit-startup-message t)      ;; turn off startup message
(setq gnus-inhibit-startup-message t) ;; turn off gnus startup message
(setq-default auto-fill-function 'do-auto-fill)   ;Autofill in all modes
(setq default-fill-column 78)         ;; set fill column 80
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)
(setq default-major-mode 'text-mode)  ;; default mode is text

;; (add-hook 'text-mode-hook '(lambda ()   
;;               (auto-fill-mode nil)      ;turn off auto-fill-mode for text-mode
;;               (longlines-mode)))        ;turn on longlines-mode for text-mode

(setq enable-recursive-minibuffers t)
(mouse-avoidance-mode 'animate) 
(fset 'yes-or-no-p 'y-or-n-p)
;set time
(display-time)                        ;; Display the time
(setq display-time-24hr-format t)     ;; 24 hour format
(setq display-time-day-and-date t)    ;; 
;(setq display-time-use-mail-icon t)
;(setq display-time-interval 10)

(setq column-number-mode t)           ;; show column
(setq transient-mark-mode t)
(global-font-lock-mode t)
(show-paren-mode t)                  
(setq show-paren-style 'parentheses) 

(tool-bar-mode -1)                      ;Don't display toolbar
(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-maximum-decoration t)

;; calendar color
(setq calendar-load-hook '(lambda ()
         (set-face-foreground 'diary-face "skyblue")
         (set-face-background 'holiday-face "slate blue")
         (set-face-foreground 'holiday-face "white")))

;; Your Name and email-address.
(setq user-full-name "Joshua Kim")               
(setq user-mail-address "kimsuelim@gmail.com")   
(global-auto-revert-mode) ;; reload file for modify
;;(require-final-newline t) ;; auto enter(new line)

;(setq make-backup-files nil)
;;(setq-default make-backup-files nil) ;; not backup files

(setq delete-auto-save-files t)       ;; delete auto save files for quit
(setq auto-save-interval 300)           ; autosave every N characters typed

(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup"))))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-by-copying t)
(setq backup-by-copying-when-linked t)
(setq backup-by-copying-when-mismatch t)

;; ;save abbrevs when files are you will be asked before the abbreviations are saved
;; (setq save-abbrevs t)
;; ;; Use M-x read-abbrev-file to read the abbrevs, or better yet, add the
;; ;; following to your ~/.emacs file:
;; (quietly-read-abbrev-file)      ;; reads the abbreviations file on startup
;; (abbrev-mode 1)

;; hippie-expand 
(global-set-key [(meta ?/)] 'hippie-expand)

(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list 
      '(
        yas/hippie-try-expand
        senator-try-expand-semantic
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; if ***.el files not have, display this error
(condition-case err
    (progn
      (require 'xxx))
  (error
   (message "Can't load xxx-mode %s" (cdr err))))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(server-start)

;;; add to load-path the directory where imaxima.el is installed.
(add-to-list 'load-path "~/.emacs.d/imaxima")

;;; add to load-path the directory where maxima.el is installed.
;(add-to-list 'load-path "/opt/local/share/maxima/5.10.0/emacs")
(add-to-list 'load-path "~/.emacs.d/maxima")

(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(setq auto-mode-alist (cons '("\\.max" . maxima-mode) auto-mode-alist))

;;; add autoload of imaxima and maxima.
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Frontend for maxima" t)

;; add autoload of imath.
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)

(setq imaxima-fnt-size "Large")
(setq imaxima-use-maxima-mode-flag t)
(setq imaxima-label-color "seagreen")
;(setq imaxima-equation-color "springgreen")
;(setq imaxima-latex-preamble "\\usepackage{mathpazo}
;\\usepackage[scaled=0.95]{helvet}
;\\usepackage{courier}
;\\usepackage[mathcal,mathbf,text-hat-accent]{euler} ")
(setq imaxima-pt-size 12)
(setq imaxima-max-scale nil)
;(setq maxima-use-dynamic-complete t)
;(setq imaxima-fnt-size "Large")
;(setq imaxima-scale-factor 1.0)
;(setq imaxima-label-color "red")
;(setq imaxima-equation-color "white")
;(setq imaxima-max-scale 0.5)
;(setq imaxima-linearize-flag t)
;(setq maxima-info-dir "/usr/share/info/")

(push "/opt/local/bin" exec-path)
;(push "/sw/bin" exec-path)

;;*************** My Emacs Key Binding ***************

(global-set-key [(meta f12)] 'recentf-open-files)
(global-set-key [(meta f11)] 'ibuffer)
(global-set-key [(meta f10)] ' delete-other-windows)
(global-set-key [(meta f9)] 'other-window)
(global-set-key [(meta f8)] 'mwe:open-command-log-buffer)
(global-set-key "\C-h" 'backward-delete-char-untabify)
(define-key global-map [f12] 'wy-go-to-char)
(global-set-key [f2] 'eshell)
(global-set-key [f3] 'bookmark-set)
(global-set-key [f4] 'list-bookmarks)
(global-set-key "\M-]" 'find-next-tag)
(global-set-key "\M-[" 'find-prev-tag)
;; (global-set-key [f5] 'cut-ctrlM) ; cut all ^M.
(put 'upcase-region 'disabled nil)

(put 'narrow-to-region 'disabled nil)

(put 'narrow-to-page 'disabled nil)

