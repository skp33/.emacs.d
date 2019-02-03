;;; init.el --- Configuration of Emacs

(package-initialize)

(require 'org)
(require 'ob-tangle)

(setq init-dir (file-name-directory (or load-file-name (buffer-file-name
))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
