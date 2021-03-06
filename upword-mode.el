;;; upword-mode.el --- a simple mode for upword notes

;; Copyright (C) 2014 Martin Balfanz

;; Author: Martin Balfanz <me@martinbalfanz.com>
;; Version: 0.1.2
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

(defgroup upword-mode nil
  "Major mode for editing UpWord note files."
  :group 'text
  :link '(url-link :tag "Repository" "https://github.com/martinbalfanz/upword-mode"))

(defgroup upword-mode-faces nil
  "Faces for UpWord syntax highlighting."
  :group 'upword-mode
  :group 'faces)

(defface upword-mode-done-face
  '((t :foreground "dim grey" :strike-through t))
  "Face for items marked as done."
  :group 'upword-mode-faces)

(defface upword-mode-bold-face
  '((t :foreground "dark turquoise" :weight bold))
  "Face for items marked as bold."
  :group 'upword-mode-faces)

(defface upword-mode-important-face
  '((t :foreground "hot pink" :weight bold))
  "Face for items marked as important."
  :group 'upword-mode-faces)

(defvar upword-mode-font-lock-defaults
  '((".*@done$" . 'upword-mode-done-face)
    (".*✓$" . 'upword-mode-done-face)
    ("^>.*$" . 'upword-mode-bold-face)
    ("^!!!.*$" . 'upword-mode-important-face)))

(defun upword-mode-move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun upword-mode-move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun upword-mode-toggle-done ()
  "")

(defun upword-mode-toggle-important ()
  "")

(defun upword-mode-toggle-bold ()
  "")

(defvar upword-mode-map nil "Keymap for upword-mode")
(when (not upword-mode-map)
  (setq upword-mode-map (make-sparse-keymap))
  (define-key upword-mode-map (kbd "M-<down>") 'upword-mode-move-line-down)
  (define-key upword-mode-map (kbd "M-<up>") 'upword-mode-move-line-up))

;;;###autoload
(define-derived-mode upword-mode text-mode "UpWord"
  "Major mode for editing UpWord Note files."
  (font-lock-add-keywords nil upword-mode-font-lock-defaults)
  (run-hooks 'upword-mode-hook))

(provide 'upword-mode)
;;; upword-mode.el ends here
