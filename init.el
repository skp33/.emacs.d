;; add package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/zoom-frm.el")
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; save when loosing focus
;; (add-hook 'focus-out-hook 'save-some-buffers)

;; order matter
(load "~/.emacs.d/configs/install_first")
(load "~/.emacs.d/configs/osx")
(load "~/.emacs.d/configs/yasnippet")
(load "~/.emacs.d/configs/scala")
(load "~/.emacs.d/configs/misc")
(load "~/.emacs.d/configs/ui")
(load "~/.emacs.d/configs/editing")
(load "~/.emacs.d/configs/project")
(load "~/.emacs.d/configs/git")
(load "~/.emacs.d/configs/windows")
(load "~/.emacs.d/configs/other")
(load "~/.emacs.d/configs/org")
