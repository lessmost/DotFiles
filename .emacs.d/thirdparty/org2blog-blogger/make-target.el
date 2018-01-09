;;;_ org2blog/make-target.el --- Help to make converted files

;;;_. Headers
;;;_ , License
;; Copyright (C) 2010  Tom Breton (Tehom)

;; Author: Tom Breton (Tehom) <tehom@panix.com>
;; Keywords: lisp, internal

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;;_ , Commentary:

;; Basically calls make.  Assumes makefile has already been set up.


;;;_ , Requires

;;;_. Body

;;;_ , Medium-general: link conversion help

;;;_  . org2blog:convert-filename
(defun org2blog:convert-filename (path suffix target-prefix src-prefix)
   ""
   (let* 
      ((path-se (file-name-sans-extension path))
	 ;;Relative to source top directory
	 (rel-path-se
	    (file-relative-name
	       path-se
	       (expand-file-name src-prefix)))
	 ;;Relocated to target top directory
	 (target-path-se
	    (expand-file-name
	       rel-path-se
	       target-prefix)))
      ;;With the new suffix
      (concat target-path-se suffix)))

;;;_  . org2blog:make-target
(defun org2blog:make-target (filename)
   ""
   ;;This completely relies on having "make" already set up properly.
   ;;Using elmake would be an alternative to make.
   
   (let ((status 
	    (call-process "make" nil nil nil filename)))
      (unless
	 (equal status 0)
	 (error "Failed to make %s" filename))))

;;;_. Footers
;;;_ , Provides

(provide 'org2blog/make-target)

;;;_ * Local emacs vars.
;;;_  + Local variables:
;;;_  + mode: allout
;;;_  + End:

;;;_ , End
;;; org2blog/make-target.el ends here
