(add-to-list 'load-path "~/.emacs.d/el")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")

(require 'auto-indent-mode)
(require 'php-mode)

;;auto-load php-mode
(add-to-list 
 'auto-mode-alist 
 '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)

(add-to-list 'load-path  "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(require 'psvn)

(require 'ibuffer)

(require 'dired-isearch)

(require 'find-file-in-project)

(set-default-font "Monoco 11")
;;hideshow
(load-library "hideshow")

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

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'php-mode-hook        'hs-minor-mode)
(add-hook 'js-mode-hook         'hs-minor-mode)

(add-hook 'c-mode-common-hook   'evil-local-mode)
(add-hook 'emacs-lisp-mode-hook 'evil-local-mode)
(add-hook 'java-mode-hook       'evil-local-mode)
(add-hook 'lisp-mode-hook       'evil-local-mode)
(add-hook 'perl-mode-hook       'evil-local-mode)
(add-hook 'sh-mode-hook         'evil-local-mode)
(add-hook 'php-mode-hook        'evil-local-mode)
(add-hook 'js-mode-hook         'evil-local-mode)
(add-hook 'css-mode-hook        'evil-local-mode)
(add-hook 'sql-mode-hook        'evil-local-mode)

(load "desktop")
(desktop-load-default)
(desktop-read)

;;hidden emacs starup-message
(setq inhibit-startup-message t)
(tool-bar-mode nil)
(setq frame-title-format "")
(setq-default mode-line-format nil) 

;;set the default text coding system
(setq locale-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq c-basic-offset 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq sgml-basic-offset 4)

(global-font-lock-mode t)
(scroll-bar-mode nil)

;;line set
(column-number-mode t)
(global-linum-mode 1)

;;make emacs can open image
(auto-image-file-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;(setq enable-recursive-minibuffers t)
(setq initial-scratch-message nil)
(global-auto-revert-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-inhibited t)
(setq auto-save-default nil)

;;scroll page settings
(setq scroll-step 1
      scroll-margin 6
      scroll-conservatively 10000)

;;auto complete
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
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

;;key bindings
(setq mac-command-modifier 'control)

(global-set-key [(control ?/)] 'hippie-expand)

(global-set-key [(f1)] 'ibuffer)
(global-set-key [(f2)] 'toggle-selective-display)
(global-set-key [(f3)] 'rgrep)
(global-set-key [(f4)] 'eshell)
(global-set-key [(f5)] 'evil-local-mode)
(global-set-key [(f8)] 'svn-status)

(global-set-key [(f10)] 'clipboard-yank)
(global-set-key [(f11)] 'clipboard-kill-region)

(global-set-key [(control l)] '(lambda () (interactive) (dired ".")))
(global-set-key [(control s)] 'occur)
(global-set-key [(control r)] 'isearch-forward-regexp)

(setq ffip-project-root-function '~/Documents/green)

(add-hook 'dired-mode-hook
          '(lambda ()
             ;;(define-key dired-mode-map [(tab)] 'dired-do-isearch-regexp) 
             (define-key dired-mode-map "\e\t" 'dired-do-isearch) 
             (define-key dired-mode-map [(?\d)] 'dired-up-directory) 
             (define-key dired-mode-map [(tab)] 'dired-up-directory)
             (define-key dired-mode-map  "z" 'dired-name-filter-only-show-matched-lines) 
             (define-key dired-mode-map [(s)] 'dired-isearch-forward) 
             (define-key dired-mode-map [(r)] 'dired-isearch-backward)

             (define-key dired-mode-map [(j)] 'dired-next-line)
             (define-key dired-mode-map [(k)] 'dired-previous-line)

             (define-key dired-mode-map [(\/)] (lambda () (interactive)
                                                 (dired "/"))) ; 按/返回根目录,
             (define-key dired-mode-map [(\~)] (lambda () (interactive)
                                                 (dired "~/"))) ; 按~返回home.

             (define-key dired-mode-map [(n)] (lambda () (interactive)
                                                (dired (concat ffip-project-root "~/Documents/green/App/Admin/Controller"))))
             (define-key dired-mode-map [(p)] (lambda () (interactive)
                                                (dired (concat ffip-project-root "~/Documents/green/Root/style"))))
             (define-key dired-mode-map [(c)] (lambda () (interactive)
                                                (dired (concat ffip-project-root "~/Documents/green/App/Defaults/Controller"))))
             (define-key dired-mode-map [(v)] (lambda () (interactive)
                                                (dired (concat ffip-project-root "~/Documents/green/App/Defaults/View"))))
             (define-key dired-mode-map [(b)] (lambda () (interactive)
                                                (dired (concat ffip-project-root "~/Documents/green/App/Defaults/Model"))))
             (define-key dired-mode-map [(y)] (lambda () (interactive)
                                                (dired (concat ffip-project-root "~/Documents/green/Root/script"))))
             ))



(require 'ido)
(ido-mode t)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(require 'browse-kill-ring)
(global-set-key [(control x)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(require 'recentf)
(recentf-mode 1)

(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function 
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl))))) 

(global-set-key [(control x)(f)] 'recentf-open-files-compl)

(autoload 'mmm-mode "mmm-mode" "Multiple Major Modes" t)
(autoload 'mmm-parse-buffer "mmm-mode" "Automatic MMM-ification" t)

(setq x-select-enable-clipboard t)

(require 'textmate)
(tm/initialize)

;;不让evil-mode污染光标颜色
(setq evil-default-cursor nil)
(set-background-color "black")

(defun my-html-mode-hooks ()
  "Set ups for how I like html mode."
  (auto-fill-mode 0)              
  (evil-local-mode 1)
  (hs-minor-mode 1)
  )
(add-hook 'html-mode-hook 'my-html-mode-hooks)

(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

(eval-after-load 'dired '(progn (require 'joseph-single-dired)))
(kill-buffer "*scratch*")
(put 'narrow-to-page 'disabled nil)

(require 'color-theme)
(color-theme-initialize)
(color-theme-mac-classic)
;; (color-theme-molokai)
;; (color-theme-blackboard)
;; (color-theme-all-hallows-eve)