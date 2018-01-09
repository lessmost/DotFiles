;;;_ org2blog/atom/bindings.el --- Bindings for org2blog/atom

;;;_. Headers
;;;_ , License
;; Copyright (C) 2011  Tom Breton (Tehom)

;; Author: Tom Breton (Tehom) <tehom@panix.com>
;; Keywords: hypermedia,convenience,outlines

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

;; 


;;;_ , Requires

;;Doesn't need any extra libraries.

;;;_. Body

;;;_ , org2blog/atom:setup-bindings
;;;###autoload
(defun org2blog/atom:setup-bindings ()
   "Set up menu bindings for org2blog/atom"
   (unless
      (lookup-key org-mode-map [menu-bar Org blog])
      (define-key-after 
	 org-mode-map 
	 [menu-bar Org blog]
	 (cons "Blog" (make-sparse-keymap "Blog"))
	 'Export/Publish...))

   (define-key-after 
      org-mode-map 
      [menu-bar Org blog atom-post]
      '("Post to an Atom blog" . org2blog/atom:post)
      t)

   (define-key-after 
      org-mode-map 
      [menu-bar Org blog atom-add-photos]
      '("Post new pictures" . org2blog/atom:dir-add-new-photos)
      t))
;;;_ , Insinuation
;;;###autoload (eval-after-load 'org-mode '(org2blog/atom:setup-bindings))

;;;_. Footers
;;;_ , Provides

(provide 'org2blog/atom/bindings)

;;;_ * Local emacs vars.
;;;_  + Local variables:
;;;_  + mode: allout
;;;_  + End:

;;;_ , End
;;; atom/bindings.el ends here
