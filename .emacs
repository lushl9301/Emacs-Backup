; load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/")

; no line number for shell
(load-file "~/.emacs.d/lisp/linum-off.el")

; ProofGeneral

;; (load-file "/home/lu/isabelle hol/ProofGeneral-4.2/generic/proof-site.el")


; auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

; change default colors
(set-background-color "grey14")
(set-foreground-color "white")
(set-cursor-color "white")

; indent
(setq-default indent-tabs-mode t)
(setq tab-width 8)

; auto indentation
;(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state 1)))
(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

; fullscreen
(global-set-key [f6] 'my-fullscreen)
(defun my-fullscreen ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_FULLSCREEN" 0))
)


; c style
(setq c-default-style "linux")

; 80 ruler
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(global-whitespace-mode +1)

; get rid of the startup message
(setq inhibit-startup-message t)

; show file full path in the title bar
(setq-default frame-title-format
(list '((buffer-file-name " %f"
(dired-directory
 dired-directory
(revert-buffer-function " %b"
("%b - Dir: " default-directory)))))))

; show parenthesis
(show-paren-mode 1)

; show line number
;(line-number-mode 1) not working?
(global-linum-mode t)

; show column number
(column-number-mode 1)

; no toolbar
(progn
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (scroll-bar-mode -1))

; keep backup away
;;;backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 2   ; how many of the newest versions to keep
      kept-old-versions 1    ; and how many of the old
      )

;;(global-set-key [f4] 'goto-line)	 ;(global-set-key "\M-g" 'go-to-line)
(global-set-key [f3] 'shell)		 ;M-x shell
;;(global-set-key [f5] 'query-replace)	 ;M-x query-replace
(global-set-key [f8] 'ispell)		 ;spell check

;;;font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;;;CUDA
(autoload 'cuda-mode "cuda-mode.el")
(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . cuda-mode))
