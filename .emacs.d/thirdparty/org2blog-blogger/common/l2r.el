;;;_ org2blog/common/l2r.el --- Persistence for org2blog

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

;; Acquisition functionality for particular modules is in the
;; respective modules (all two of them)


;;;_ , Requires

(require 'tinydb/persist)

;;;_. Body

;;;_ , Convert links as Atom indicates
;;;_  . Customization
;;Should be absolutized (another variable, internal?).  And should
;;fetch it on a per-directory basis.
(defcustom org2blog/common/l2r-alist-file
   "~/.org2blog-local2remote-alist"
   "File that contains the persisting alist from local filenames to
remote URLs" 
   :type 'file
   :group 'org)
;;;_  . Variables
(defvar org2blog/common/l2r-tq 
   (tinydb-persist-make-q org2blog/common/l2r-alist-file '())
   "Tiny db object for org2blog/common/l2r" )

;;;_  . org2blog/common/l2r-remote-url
(defun org2blog/common/l2r-remote-url (path)
   "Return the persisting translation of PATH."
   (let*
      (  (path
	    (if (string-match "file://" path)
	       (substring path (match-end 0))
	       path))
	 (true-path (expand-file-name path)))
   (cadr
      (tinydb-alist-assoc org2blog/common/l2r-tq true-path))))

;;;_  . org2blog/common/l2r-cvt-link
(defun org2blog/common/l2r-cvt-link (opt-plist type path)
   "Convert arguments to (type path) list of the remote url."
   (declare (ignored opt-plist))
   (let
      ((cvted-path
	  (org2blog/common/l2r-remote-url path)))
      (when cvted-path
	 (list type cvted-path))))

;;;_  . org2blog/common/l2r-store-remote-url
(defun org2blog/common/l2r-store-remote-url (filepath url)
   "Persistingly store the translation from FILEPATH to URL."
   (assert (file-name-absolute-p filepath) t)
   (tinydb-alist-pushnew
      org2blog/common/l2r-tq filepath (list url)))
;;;_  . org2blog/common/l2r-store-remote-url-yx
;;;###autoload
(defun org2blog/common/l2r-store-remote-url-yx (url filepath)
   "Persistingly store the translation from FILEPATH to URL.
An arg-conformant version of `org2blog/common/l2r-store-remote-url'"
   (assert (file-name-absolute-p filepath) t)
   (tinydb-alist-pushnew
      org2blog/common/l2r-tq filepath (list url)))

;;;_. Footers
;;;_ , Provides

(provide 'org2blog/common/l2r)

;;;_ * Local emacs vars.
;;;_  + Local variables:
;;;_  + mode: allout
;;;_  + End:

;;;_ , End
;;; org2blog/common/l2r.el ends here
