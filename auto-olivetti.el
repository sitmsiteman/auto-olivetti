;;; auto-olivetti.el --- Automatically enable olivetti-mode when window is wide -*- lexical-binding: t -*-

;; Copyright (C) 2023 Ashton Wiersdorf

;; Author: Ashton Wiersdorf <mail@wiersdorf.dev>
;; Created: 2023
;; Version: 0.0.1
;; Package-Requires: ((olivetti "2.0"))
;; SPDX-License-Identifier: MIT
;; Homepage: https://sr.ht/~ashton314/auto-olivetti
;; Keywords: olivetti, writing

;;; Commentary:

;; Olivetti is a wonderful mode. So wonderful, in fact, that I wish it came on
;; automatically. This package does just that.

;;; Code:

(defgroup auto-olivetti nil
  "Automatically enable `olivetti-mode' when window is wide."
  :link '(url-link :tag "Homepage" "FIXME")
  :prefix "auto-olivetti-")

(defcustom auto-olivetti-enabled-modes '(prog-mode text-mode)
  "Modes for which `olivetti-mode' should automatically be enabled for."
  :type '(repeat symbol))

(defcustom auto-olivetti-threshold-fraction 1.5
  "Fraction of `olivetti-body-width' at which to enable `olivetti-mode'."
  :type 'float)

(defcustom auto-olivetti-threshold-absolute 180
  "Number of columns at which to enable `olivetti-mode'."
  :type 'integer)

(defcustom auto-olivetti-threshold-method 'fraction
  "How to determine if the activation threshold has been met.
- fraction: use `auto-olivetti-threshold-fraction' * `olivetti-body-width'
- absolute: use `auto-olivetti-threshold-absolute'"
  :type '(choice (const fraction) (const absolute)))

(defun auto-olivetti--do-change ()
  "Turn on or off `olivetti-mode' depending on the current window configuration."
  (if (and auto-olivetti-mode
           (apply #'derived-mode-p auto-olivetti-enabled-modes)
           (> (window-total-width)
              (if (eq auto-olivetti-threshold-method 'fraction)
                  (* olivetti-body-width auto-olivetti-threshold-fraction)
                auto-olivetti-threshold-absolute)))
      (olivetti-mode +1)
    (olivetti-mode -1)))

;;;###autoload
(define-minor-mode auto-olivetti-mode
  "Automatically enable `olivetti-mode'."
  :global t :group 'auto-olivetti
  (if auto-olivetti-mode
      (add-hook 'window-configuration-change-hook 'auto-olivetti--do-change)
    (remove-hook 'window-configuration-change-hook 'auto-olivetti--do-change)))

(provide 'auto-olivetti)
;;; auto-olivetti.el ends here
