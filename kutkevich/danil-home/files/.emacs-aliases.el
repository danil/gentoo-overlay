;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.
(setq system-time-locale "C")
(setq calendar-week-start-day 1)
(global-font-lock-mode 1)
(transient-mark-mode nil)
(set-keyboard-coding-system 'mule-utf-8)
;(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'utf-8)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(savehist-mode 1)
;;; Menu Bar
;;; <http://gnu.org/software/emacs/manual/html_node/emacs/Menu-Bars.html>,
;;; <http://emacswiki.org/MenuBar>.
(menu-bar-mode -1)
(setq initial-scratch-message
";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
")

;;; AnsiColor <http://emacswiki.org/AnsiColor>
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;(modify-coding-system-alist 'file "\\.txt\\'" 'cyrillic-koi8)
;(set-language-environment 'cyrillic-koi8)
(add-to-list 'load-path "~/share/emacs/site-lisp")

;;; IswitchB <http://emacswiki.org/IswitchBuffers>.
(iswitchb-mode 1)
;; (setq iswitchb-buffer-ignore '("^ " "*scratch*" "*Messages*"
;;                                "*Completions*" "*Ibuffer*"))
;(setq iswitchb-default-method 'samewindow)

;;; Ibuffer <http://emacswiki.org/IbufferMode>.
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;(setq ibuffer-use-other-window 1)

;;; Server <http://shreevatsa.wordpress.com/tag/emacs/>.
;; (remove-hook 'kill-buffer-query-functions
;;              'server-kill-buffer-query-function)

;;; Uniquify
;;; <http://gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html>.
(require 'uniquify)
;; nil, forward, reverse, post-forward or post-forward-angle-brackets
(setq uniquify-buffer-name-style 'forward)
;(setq uniquify-separator "/")
;; Rename after killing uniquified.
;(setq uniquify-after-kill-buffer-p t)
;; Don't muck with special buffers.
;(setq uniquify-ignore-buffers-re "^\\*")

;;; Browse Url with Epiphany.
;(setq browse-url-browser-function 'browse-url-epiphany)

;; For tab instead of new window.
;(setq browse-url-epiphany-new-window-is-tab t)

(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "epiphany"
  browse-url-generic-args '("--new-tab"))

;;; Spelling.
;(setq-default ispell-program-name "/usr/bin/aspell")
;(setq-default ispell-program-name "/usr/bin/hunspell")
(setq ispell-dictionary "ru")

;;; InteractiveSpell.
;(setq ispell-dictionary "german")

;;; TRAMP.
;;; <http://emacswiki.org/TrampMode>.
;(setq tramp-default-method "ssh")

;;; Org-mode.
(add-to-list 'load-path "~/share/emacs/site-lisp/org-mode/lisp")
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; Disable previously defined unstrict pattern.
(add-to-list 'auto-mode-alist '("\\.org\\'" . nil))
;; Add more strict pattern.
(add-to-list 'auto-mode-alist '("/org/.*\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;;; Interactively Do Things (Org-mode with IDO)
(add-hook 'org-mode-hook (lambda () (ido-mode t)))
(setq org-completion-use-ido t)

;;; Org Clock.
;; Sometimes I change tasks I'm clocking quickly - this removes
;; clocked tasks with 0:00 duration.
;(setq org-clock-out-remove-zero-time-clocks t)

;;; Org Agenda.
;; (setq org-agenda-files
;;   (list "~/org/home.org"
;;         "~/org/JohnStudio.org"))
(setq org-agenda-files
      (append (file-expand-wildcards "~/org/*.org")
              (file-expand-wildcards "~/org/home/*.org")))
;; (load-library "find-lisp")
;; (setq org-agenda-files (find-lisp-find-files "~/org" "\.org\\'"))
(setq org-agenda-custom-commands
      '(("h" "Home" todo "TODO"
         ((org-agenda-files
           (file-expand-wildcards "~/org/home/*.org"))))
        ("w" "Work" todo "TODO"
         ((org-agenda-files (list "~/org/JohnStudio.org"))))))

;;; DVC.
;(add-to-list 'load-path "~/share/emacs/site-lisp/dvc")
;(autoload 'dvc-status "dvc-load" nil t)
;(setq dvc-tips-enabled nil)

;;; psvn.
; Set up autoloads for psvn (svn directory edit mode for emacs)
;(autoload 'svn-status "psvn" nil t)

;;; markdown-mode.el --- Major mode to edit Markdown files in Emacs.
(add-to-list 'load-path "~/share/emacs/site-lisp/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-hook 'markdown-mode-hook (lambda () (setq truncate-lines t)))
(setq auto-mode-alist
      (cons '("\\.md\\'" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/README\\'" . markdown-mode) auto-mode-alist))
;; Mutt temporary files.
(setq auto-mode-alist
      (cons '("/mutt[-a-zA-Z0-9]+\\'" . markdown-mode) auto-mode-alist))

;;; Lua mode.
(add-to-list 'auto-mode-alist '("\\.ws\\'" . lua-mode))

;;; HTML mode.
(add-to-list 'auto-mode-alist '("\\.op\\'" . html-mode))

;;; Logrotate scripts.
(add-to-list 'auto-mode-alist '("/etc/logrotate.d/" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.logrotate\\'" . shell-script-mode))

;;; Cron.
(setq auto-mode-alist
      (cons '("/crontab\\'" . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/anacrontab\\'" . shell-script-mode) auto-mode-alist))

;;; Shell scripts.
(setq auto-mode-alist
      (cons '("/\\.bash_aliases\\'" . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/\\.ackrc\\'" . shell-script-mode) auto-mode-alist))

;;; Configs.
(setq auto-mode-alist
      (cons '("/\\.gitconfig\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/\\.inputrc\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/\\.screenrc\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/\\.moc/keymap\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/\\.Xmodmap\\'" . conf-xdefaults-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/\\.rvmrc\\'" . conf-mode) auto-mode-alist))

;;; Lisp.
(setq auto-mode-alist
      (cons '("/\\.stumpwmrc\\'" . lisp-mode) auto-mode-alist))

;;; Perl.
(setq auto-mode-alist
      (cons '("/etc/nginx/sites-available/" . perl-mode) auto-mode-alist))

;;; Cucumber features.
(setq auto-mode-alist
      (cons '("\\.features\\'" . conf-mode) auto-mode-alist))

;;; Gentoo ebuild.
;; (setq auto-mode-alist
;;       (cons '("\\.ebuild\\'" . sh-mode) auto-mode-alist))

;;; Gentoo confs.
(add-to-list 'auto-mode-alist '("/etc/conf.d/" . conf-mode))
(add-to-list 'auto-mode-alist '("/etc/env.d/" . conf-mode))
(setq auto-mode-alist
      (cons '("/etc/portage/package\\.mask\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/etc/portage/package\\.keywords\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/etc/portage/package\\.use\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/etc/portage/package\\.unmask\\'" . conf-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/etc/portage/profile/use\\.mask\\'" . conf-mode) auto-mode-alist))

;;; Auto Fill Mode
;;; <http://gnu.org/software/emacs/manual/html_node/emacs/Auto-Fill.html>.
;(add-hook 'mail-mode-hook (lambda () (auto-fill-mode t)))

;;; Column-marker, <http://emacswiki.org/ColumnMarker>,
;;; <git://github.com/emacsmirror/column-marker.git>.
(add-to-list 'load-path "~/share/emacs/site-lisp/column-marker")
(autoload 'column-marker-1 "column-marker" "Column-marker." t)

;;; Whitespace mode.
(setq whitespace-style
      '(trailing space-before-tab space-after-tab)) ;empty lines-tail))
;(setq whitespace-line-column 80)

;;; Some minor modes.
(defun some-minor-modes-turn-on ()
  (unless buffer-read-only (whitespace-mode t) (column-marker-1 80)))
(add-hook 'change-log-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'conf-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'emacs-lisp-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'html-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'java-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'lisp-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'lua-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'makefile-gmake-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'markdown-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'org-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'perl-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'php-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'ruby-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'sh-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'whitespace-mode-hook (lambda () (interactive) (column-marker-1 80)))
(add-hook 'xml-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))
(add-hook 'yaml-mode (lambda () (interactive) (some-minor-modes-turn-on)))
;(add-hook 'mail-mode-hook (lambda () (interactive) (some-minor-modes-turn-on)))

;; (add-hook 'markdown-mode-hook
;;           (lambda () (if (string-match "/bookmarks\\.md\\'"
;;                                        (buffer-file-name))
;;                          (setq whitespace-style
;;                                '(trailing space-before-tab
;;                                           space-after-tab empty))
;;                        (some-minor-modes-turn-on))))

;;; Highlight current line
;;; <http://emacs-fu.blogspot.com/2008/12/highlighting-current-line.html>.
;; (defface hl-line '((t (:background "Gray")))
;;   "Face to use for `hl-line-face`." :group 'hl-line)
;; (setq hl-line-face 'hl-line)
(global-hl-line-mode t)
;;; <http://emacsblog.org/2007/04/09/highlight-the-current-line/#comment-284>.
(defun local-hl-line-mode-off ()
  (interactive)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))
(add-hook 'ediff-mode-hook 'local-hl-line-mode-off)
(add-hook 'term-mode-hook 'local-hl-line-mode-off)

;;; Less minor mode.
;; Keybinding guide <http://emacswiki.org/KeybindingGuide>.
(global-set-key "" (quote less-minor-mode))
(add-hook 'find-file-hook
          (lambda () (when buffer-read-only
                       (less-minor-mode-on))))

;; Emacs startup file for the Debian GNU/Linux css-mode package
;; Set up to autoload
;(autoload 'css-mode "css-mode" "Major mode for editing CSS style sheets" t)
;(setq auto-mode-alist
;     (cons '("\\.css\\'" . css-mode) auto-mode-alist))

;;; Rinari.
;(add-to-list 'load-path "~/share/emacs/site-lisp/rinari")
;(autoload 'rinari-launch "rinari"
;  "Rinari Is Not A Rails IDE (it is an Emacs minor mode for Rails)" t)
;(autoload 'rinari-web-server "rinari" "Run Rails script/server." t)

;;; Interactively Do Things (highly recommended with rinari, but not
;;; strictly required).
(add-hook 'rinari-minor-mode-hook (lambda () (ido-mode t)))

;;; ri-emacs.
;; (setq ri-ruby-script "~/share/emacs/site-lisp/ri-emacs/ri-emacs.rb")
;; (autoload 'ri "~/share/emacs/site-lisp/ri-emacs/ri-ruby.el" nil t)
;; (add-hook 'ruby-mode-hook
;;   (lambda ()
;;     (local-set-key 'f1 'ri)
;;     (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
;;     (local-set-key 'f4 'ri-ruby-show-args)
;;     ))

;;; Ruby and Rails documentation lookup.
;; (defun ror-doc-lookup () (local-set-key (kbd "<f1>") 'doc-symbol-lookup))
;; ;http://www.google.com/search?num=100&q=site%3Aruby-doc.org/core+
;; (defun doc-symbol-lookup ()
;;   (interactive)
;;   (let ((symbol (symbol-at-point)))
;;     (if (not symbol)
;;       (message "No symbol at point.")
;;       (browse-url
;;         (concat
;;           "http://www.google.com/search?num=100&q=site%3Aapi.rubyonrails.org+"
;;           (symbol-name symbol))))))

;;; ruby-mode.
;(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
;(setq auto-mode-alist
;      (cons '("\\.rb\\'" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("/[rR]akefile\\'" . conf-mode) auto-mode-alist))
;; (add-hook 'ruby-mode-hook 'ror-doc-lookup)

;;; rhtml-mode.
(add-to-list 'load-path "~/share/emacs/site-lisp/rhtml")
(autoload 'rhtml-mode "rhtml-mode" nil t)
(setq auto-mode-alist
      (cons '("\\.html\\.erb\\'" . rhtml-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . rhtml-mode))
(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))
;; (add-hook 'rhtml-mode-hook 'ror-doc-lookup)

;;; Tags
;;; <http://emacswiki.org/BuildTags#toc2>.
(setq path-to-ctags "/usr/bin/exuberant-ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name dir-name)))

;;; yaml-mode --- Major mode for editing YAML files.
(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;; jabber.el
;; Set up autoloads for jabber.el
;(require 'jabber)
;; (autoload 'jabber-connect "jabber" nil t)
;; (setq jabber-account-list (quote (("danilkutkevich@jabber.org"))))
;; (setq jabber-history-enabled t)

;; Flymake <http://emacswiki.org/FlyMake>.
;; Don't want flymake mode for ruby regions in rhtml files and also on
;; read only files.
;; (add-hook 'ruby-mode-hook
;;   '(lambda () (if (and (not (null buffer-file-name))
;;                        (file-writable-p buffer-file-name))
;;                   (flymake-mode))))

;(setq interpreter-mode-alist
;      (cons '("ruby" . ruby-mode) interpreter-mode-alist))
;(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;(autoload 'inf-ruby-keys "inf-ruby"
;  "Set local key defs for inf-ruby in ruby-mode")
;(add-hook 'ruby-mode-hook
;          '(lambda ()
;             (inf-ruby-keys)
;             ))

;; Emacs startup file for the Debian GNU/Linux php-elisp package
;(setq auto-mode-alist
;      (cons '("\\.php[34]?\\'\\|\\.phtml\\." . php-mode) auto-mode-alist))
;(autoload 'php-mode "php-elisp/php-mode" "mode for editing php files" t)

;;; color-theme
;;; <http://www.nongnu.org/color-theme/#sec8>.
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-hober)))

;;; Newsticker <http://www.nongnu.org/newsticker>,
;;; <http://lists.gnu.org/archive/html/gnu-emacs-sources/2008-12/msg00009.html>.
;; ;;(setq newsticker-groups-filename "~/MyEmacs/Configure-File/Newsticker/newsticker-groups")
;; ;;(setq newsticker-imagecache-dirname "~/MyEmacs/Configure-File/Newsticker/newsticker-images")
;; ;;(setq newsticker-dir "~/MyEmacs/Configure-File/Newsticker")
;; (setq newsticker-automatically-mark-items-as-old nil)
;; (setq newsticker-automatically-mark-visited-items-as-old nil)
;; ;;(setq newsticker-retrieval-interval 600)
;; (setq newsticker-html-renderer (quote w3m-region))
;; ;;(setq newsticker-retrieval-method (quote extern))
;; ;;(setq newsticker-treeview-treewindow-width 40)
;; ;;(setq newsticker-treeview-listwindow-height 30)
;; ;;(setq newsticker-wget-arguments (quote ("-q" "-O" "-" "--user-agent" "testing")))
;; ;;(run-with-timer 0 newsticker-update-news-repeat 'newsticker-update-news)
;; (setq newsticker-url-list-defaults
;;       '(
;;         ("bzr_day" "http://bzr-day.blogspot.com/feeds/posts/default?alt=rss")
;;         ("emacs_planet_ru" "http://emacs.defun.ru/atom.xml")
;;         ("jquery_blog" "http://feeds.feedburner.com/jquery/")
;;         ("keplerproject_org_unix_installation" "http://keplerproject.org/en/UNIX_Installation.rss")
;;         ("lj_ru_gentoo" "http://community.livejournal.com/ru_gentoo/data/rss")
;;         ("openmoko_planet" "http://planet.openmoko.org/rss10.xml")
;;         ("rail0rz" "http://feeds2.feedburner.com/railorz")
;;         ("railscasts" "http://feeds.feedburner.com/railscasts")
;;         ("railsclub_ru" "http://feeds2.feedburner.com/RailsClubRu")
;;         ("ruby_noname_podcast" "http://ruby.rpod.ru/rss.xml")
;;         ("rubyonrails_planet_ru" "http://planet.rubyonrails.ru/xml/rss")
;;         ("softwaremaniacs_org" "http://softwaremaniacs.org/blog/feed/")
;;         ))
