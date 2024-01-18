;;; shfmt.el --- Reformat shell scripts using shfmt  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; Keywords: languages
;; URL: https://github.com/purcell/emacs-shfmt
;; Package-Requires: ((emacs "24") (reformatter "0.3"))
;; Version: 0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides commands and a minor mode for easily reformatting shell scripts
;; using the external "shfmt" program.

;; Call `shfmt-buffer' or `shfmt-region' as convenient.

;; Enable `shfmt-on-save-mode' in shell script buffers like this:

;;     (add-hook 'sh-mode-hook 'shfmt-on-save-mode)

;; or locally to your project with a form in your .dir-locals.el like
;; this:

;;     ((sh-mode
;;       (mode . shfmt-on-save)))

;; You might like to bind `shfmt-region' or `shfmt-buffer' to a key,
;; e.g. with:

;;     (define-key 'sh-mode-map (kbd "C-c C-f") 'shfmt)

;;; Code:


;; Minor mode and customisation

(require 'reformatter)

(defgroup shfmt nil
  "Reformat shell scripts using shfmt."
  :group 'languages)

(defcustom shfmt-command "shfmt"
  "Command used for reformatting."
  :type 'string)

(defcustom shfmt-arguments ()
  "Arguments passed to shfmt.
Whichever arguments are passed, it is important that shfmt be run
in reformatting mode: it should output a reformatted version of
the input text.  This means that you should avoid flags like
`-d', for example."
  :type '(repeat string))


;; Commands for reformatting

;;;###autoload (autoload 'shfmt-buffer "shfmt" nil t)
;;;###autoload (autoload 'shfmt-region "shfmt" nil t)
;;;###autoload (autoload 'shfmt-on-save-mode "shfmt" nil t)
;;;###autoload (autoload 'shfmt-mode "shfmt" nil t)
(reformatter-define shfmt
  :program shfmt-command
  ;; Pass the filename to `shfmt` as it may influence the Editorconfig pattern "shfmt" picks up
  :args (append (list "--filename" (or (buffer-file-name) input-file)) shfmt-arguments)
  :lighter " ShFmt"
  :group 'shfmt)


(provide 'shfmt)
;;; shfmt.el ends here
