;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;;
;; (setq doom-font (font-spec :family "CaskaydiaMono Nerd Font" :size 25 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "CaskaydiaMono Nerd Font" :size 27))

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 25 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 27))

;; Additional themes
(add-to-list 'custom-theme-load-path "~/.doom.d/themes/")

(setq doom-theme 'catppuccin)

(defun thanos/wtype-text (text)
  "Process TEXT for wtype, handling newlines properly."
  (let* ((has-final-newline (string-match-p "\n$" text))
         (lines (split-string text "\n"))
         (last-idx (1- (length lines))))
    (string-join
     (cl-loop for line in lines
              for i from 0
              collect (cond
                       ;; Last line without final newline
                       ((and (= i last-idx) (not has-final-newline))
                        (format "wtype -s 350 \"%s\""
                                (replace-regexp-in-string "\"" "\\\\\"" line)))
                       ;; Any other line
                       (t
                        (format "wtype -s 350 \"%s\" && wtype -k Return"
                                (replace-regexp-in-string "\"" "\\\\\"" line)))))
     " && ")))

(defun thanos/type ()
  "Launch a temporary frame with a clean buffer for typing."
  (interactive)
  (let ((frame (make-frame '((name . "emacs-float")
                             (fullscreen . 0)
                             (undecorated . t)
                             (width . 70)
                             (height . 20))))
        (buf (get-buffer-create "emacs-float")))
    (select-frame frame)
    (switch-to-buffer buf)
    (erase-buffer)
    (org-mode)
    (setq-local header-line-format
                (format " %s to insert text or %s to cancel."
                        (propertize "C-c C-c" 'face 'help-key-binding)
                        (propertize "C-c C-k" 'face 'help-key-binding)))
    (local-set-key (kbd "C-c C-k")
                   (lambda () (interactive)
                     (kill-new (buffer-string))
                     (delete-frame)))
    (local-set-key (kbd "C-c C-c")
                   (lambda () (interactive)
                     (start-process-shell-command
                      "wtype" nil
                      (thanos/wtype-text (buffer-string)))
                     (delete-frame)))))


;; Chita, Russia - Corrected coordinates and time zone
(require 'solar)
(setq calendar-latitude 52.033)
(setq calendar-longitude 113.5)
(setq calendar-time-zone 540)  ; UTC+9
(setq calendar-location-name "Chita, Russia")

;; Shell setup
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell "/bin/fish")
(setq-default explicit-shell-file-name "/bin/fish")

;; Keybinds
(map! :leader
      "s v" #'split-window-horizontally)

(map! :n
      "C-h" #'evil-window-left
      "C-l" #'evil-window-right
      "C-j" #'evil-window-down
      "C-k" #'evil-window-up)

(defun my/stop-service ()
  "Stop a specific hardcoded service using systemctl."
  (interactive)
  (vterm-send-string "sudo systemctl stop zapret")
  (vterm-send-return))


;; Org setup
(setq org-directory "~/org")
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))

(after! org-capture
  (setq org-capture-templates
        '(("i" "Refile" entry
           (file "~/org/refile.org")
           "* %?\n:PROPERTIES:\n:CAPTURED: %U\n:END:")))

  (map! :leader
        :desc "Open refile org file"
        "o i" (lambda () (interactive) (org-capture nil "i")))
  (map! :leader
        :desc "Open inbox file"
        "o I" (lambda () (interactive)
                (find-file "~/org/refile.org"))))


;; Treesitter for TS/TSX
(after! treesit
  (setq treesit-language-source-alist
        '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src" nil nil)
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src" nil nil))))

;; TS
(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :config
  (add-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook) #'lsp!))

;; Disabling annoying hover docs
(global-eldoc-mode -1)


;; Theme
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; clipboard sanity, only accessed with "+ evil register
;; (setq evil-save-to-clipboard nil)
;; (setq select-enable-clipboard nil)
;; (setq select-enable-primary nil)
;; (setq save-interprogram-paste-before-kill nil)
