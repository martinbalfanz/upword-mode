;;; upword-mode.el --- a simple mode for upword notes

;; Copyright (C) 2014 Martin Balfanz

;; Author: Martin Balfanz <me@martinbalfanz.com>
;; Version: 0.1.0
;; Keywords: notes

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A simple mode for UpWord Notes.
;;
;; See http://www.upwordnotes.com/

;;; Code:

(defgroup upword-mode-faces nil
  "Faces for syntax highlighting."
  :group 'faces)

(defface upword-mode-done-face
  '((t :foreground "dim grey" :strike-through t))
  "Face for items marked as done."
  :group 'faces)

(defface upword-mode-bold-face
  '((t :foreground "dark turquoise" :weight bold))
  "Face for items marked as bold."
  :group 'faces)

(defface upword-mode-important-face
  '((t :foreground "hot pink" :weight bold))
  "Face for items marked as important."
  :group 'upword-mode-faces)

(defvar upword-mode-font-lock-defaults
  '((".*@done$" . 'upword-mode-done-face)
    (".*✓$" . 'upword-mode-done-face)
    ("^>.*$" . 'upword-mode-bold-face)
    ("^!!!.*$" . 'upword-mode-important-face)))

;;;###autoload
(define-derived-mode upword-mode text-mode "UpWord"
  "Major mode for editing UpWord Note files."
  ;;(setq font-lock-defaults upword-mode-font-lock-defaults)
  (font-lock-add-keywords nil upword-mode-font-lock-defaults)
  (run-hooks 'upword-mode-hook))

(provide 'upword-mode)
;;; upword-mode.el ends here
