;;;_ org2blog/dia-links.el --- Dia links and general support, for org

;;;_. Headers
;;;_ , License
;; Copyright (C) 2010  Tom Breton (Tehom)

;; Author: Tom Breton (Tehom) <tehom@panix.com>
;; Keywords: lisp, internal, outlines

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

;; $$MOVE ME to org-mode


;;;_ , Requires

;;(require 'org2blog/for-org-html)
(require 'org2blog/make-target)
;;;_. Body

;;;_ , Dia links specifically
;;;_  . Config
;;In emacs 23, user may set these per directory using .dir-locals.
(defconst tehom-org-dia-src-path "diagrams/"
   "Path to dia files" )

(defconst tehom-org-dia-image-path "images/"
   "Path to dia images" )

;;;_  . Set up dia links

(org-add-link-type "dia" 'tehom-org-dia-open 'tehom-org-dia-export)

;;No store-link is possible because dia is outside emacs.

;;;_  . tehom-org-dia-open

(defun tehom-org-dia-open (path)
   "Open the diagram with dia"
   
   (start-process-shell-command "dia" nil "dia" 
      (org2blog:convert-filename 
	 path ".dia" tehom-org-dia-src-path)))


;;;_   , Tests

;;Can't automate testing this.

;;;_ , tehom-org-dia-export
(defun tehom-org-dia-export (path desc format)
   ""
   (when
      (eq format 'html)
      (let
	 ((image-filename
	     ;;Same base name, with "png" suffix and relocated to the
	     ;;respective image directory
	     (org2blog:convert-filename 
		path ".png" tehom-org-dia-image-path
		tehom-org-dia-src-path)))
	 
	 ;;Cause the image to be made if out of date.
	 (org2blog:make-target image-filename)
	 (org-html-make-link '()
	    "file" image-filename nil nil "" t))))
;;;_  . Tests

;;Can't automate testing this.

;;;_. Footers
;;;_ , Provides

(provide 'org2blog/dia-links)

;;;_ * Local emacs vars.
;;;_  + Local variables:
;;;_  + mode: allout
;;;_  + End:

;;;_ , End
;;; org2blog/dia-links.el ends here
