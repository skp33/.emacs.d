;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil
 debug-on-error t)

(setenv "PATH"
  (concat
   "C:/Program Files (x86)/scala/bin" ";"
   "C:/Program Files (x86)/sbt/bin" ";"
   "C:/cygwin64/usr/bin" ";"
   (getenv "PATH")
  )
)

(when (string-equal system-type "windows-nt")
  (let (
        (mypaths
         '(
		   "C:/Program Files (x86)/scala/bin" ";"
		   "C:/Program Files (x86)/sbt/bin" ";"
		   "C:/cygwin64/usr/bin" ";"

           "C:/cygwin64/usr/local/bin"
           "C:/cygwin64/usr/bin"
           "C:/cygwin64/bin"

           "C:/Program Files (x86)/Mozilla Firefox/"
           ) )
        )

    (setenv "PATH" (mapconcat 'identity mypaths ";") )

    (setq exec-path (append mypaths (list "." exec-directory)) )
    ) )

	
;; show env var named path
(getenv "PATH")
 
(setenv "PATH" (shell-command-to-string "C:\cygwin64\bin\mintty.exe -h always /bin/bash -l -e 'echo -n $PATH'"))
 
;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))
  
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))
 
(setq
scala-indent:use-javadoc-style t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (sbt-mode scala-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
