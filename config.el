;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Lukas Peter Filipcik"
      user-mail-address "lukas.p.filipcik@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-molokai)
(setq doom-font (font-spec :family "Roboto Mono" :size 12 :weight 'medium))

;; (use-package! doom-nano-modeline
;;   :config
;;   (doom-nano-modeline-mode 1)
;;   (global-hide-mode-line-mode 1))

;; (after! doom-themes
  ;; (load-theme 'doom-nano-dark t))
;; (after! doom-themes
;;   (load-theme 'doom-nano-light t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(use-package org-journal
  :ensure t
  :defer t
  :config
  (setq org-journal-dir "~/org/journal")
  )

(use-package! org-roam
  :after org
  :config
  (setq org-roam-v2-ack t)
  (setq org-roam-completion-everywhere 'nil)
  (setq org-roam-directory (file-truename "~/org/roam"))
  (setq org-roam-db-location "~/org/org-roam.db")
  )

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(display-time-mode 1)  ;Time in the modeline
(setq doom-modeline-enable-word-count 1)
(setq doom-modeline-continuous-word-count-modes '(org-mode))
;; Consider whether this is useful at all
;; (setq evil-vsplit-window-right t)
;;       evil-split-window-below t)
;;
;; (after! company
;;   (setq +lsp-company-backends '(company-tabnine  company-capf company-yasnippet))
;;   (setq company-show-numbers t)
;;   (setq company-idle-delay 0)
;; )
(setq +format-with-lsp nil)

(use-package lsp-tailwindcss
   :init
   (setq lsp-tailwindcss-add-on-mode t)
   )

(add-hook 'before-save-hook 'lsp-tailwindcss-rustywind-before-save)

(require 'dap-node)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((R. t)
   (bash.  t)
   (python. t)
   (jupyter. t)))

(use-package blamer
  :bind (("s-i" . blamer-show-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 00)
  (blamer-uncommitted-changes-message "NOT COMMITTED")

  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 90
                    :italic t)))
  :config
  (global-blamer-mode t))
