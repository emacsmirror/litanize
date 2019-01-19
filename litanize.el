;;; litanize.el --- generate "Latour Litanies"

;; Copyright 2019 FoAM oü
;;
;; AUTHOR: nik gaffney <nik@fo.am>
;; Created: 2019-01-19
;; Version: 0.1
;; Keywords: Latour Litany, alien phenomenology, ontography, metaphorism, carpentry
;; X-URL: https://github.com/zzkt/litanize 

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.



;;; Commentary:

;; a simple version of Ian Bogost's method of generating "Latour Litanies"
;; from random wikipedia titles as an exercise in ontography, metaphorism,
;; and carpentry
;;
;; currently uses random wikipedia titles as elements. might be extended to
;; use other lists in other futures.
;; 
;; 'M-x litanize'  will generate a litany in a new buffer
;;
;; 'M-x insert-litany' will generate a litany at the point
;;
;; further -> http://bogost.com/writing/blog/latour_litanizer/

;;; Code:

(provide 'litanize)
(eval-when-compile
  (require 'cl))

(require 'enlive) 
;; enlive can be installed via melpa or from https://github.com/zweifisch/enlive


(defun random-wp-title ()
  (s-chop-suffix
   " - Wikipedia"
   (nth 2 (enlive-query
	   (enlive-fetch "https://en.wikipedia.org/wiki/Special:Random")
	   [title]))))

(defun litanize ()
  "Create a Latour Litany in it's own buffer"
  (interactive)
  (with-current-buffer (get-buffer-create "*latour litany*")
    (erase-buffer)
    (dotimes (i 5)
      (insert (random-wp-title))
      (cond ((<= i 2) (insert ", "))
	    ((=  i 3) (insert " & "))
	    ((=  i 4) (insert "."))))))


(defun insert-litany ()
  "Create a Latour Litany at the current point"
  (interactive)
    (dotimes (i 5)
      (insert (random-wp-title))
      (cond ((<= i 2) (insert ", "))
	    ((=  i 3) (insert " & "))
	    ((=  i 4) (insert ".")))))

(defun latour-litany (length)
  "generate an arbitary (or random) length litany as a string"
)



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;; litanize.el ends here
