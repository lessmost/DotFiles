;;;_ org2blog/atom/main.el --- Code for exporting org-mode to g-client

;;;_. Headers
;;;_ , License
;; Copyright (C) 2010  Tom Breton (Tehom)

;; Author: Tom Breton (Tehom) <tehom@panix.com>
;; Keywords: convenience, tools, outlines

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

(require 'org)
(require 'org-exp)
(unless (boundp 'org-html-cvt-link-fn)
   (error "Requires a different version of org-mode.  See README.org"))
(require 'gblogger)
(require 'org2blog/common/l2r)

;;;_. Body
;;;_ , Setup

(add-hook 'g-app-afterpost-hook
   #'org2blog/common/l2r-store-remote-url-yx)

;;;_ , Make a post
;;;###autoload
(defun org2blog/atom:post ()
   "Export the current org buffer to gblogger."
   
   (interactive)
   (unless (org-mode-p)
      (error "Only useful in an org-mode buffer"))
   
   (let*
      (	 
	 (org-file-name (expand-file-name buffer-file-name))
	 (org-export-inbuffer-options-extra
	    '(("BLOGLABELS" :blog-labels)))
	 (plist (org-infile-export-plist))
	 (blog-labels
	    (let 
	       ((labels-string
		   (plist-get plist :blog-labels)))
	       (if labels-string
		  (split-string labels-string "," t)
		  '())))
	 (title
	    (or
	       (plist-get plist :title)
	       nil))
	 (str
	    (let
	       ((org-html-cvt-link-fn #'org2blog/common/l2r-cvt-link))
	       (org-export-as-html nil nil nil 'string t)))
	 (url 
	    (gblogger-blog->posting-url (gblogger-ensure-blog)))
	 (buffer
	    (gblogger-new-entry url title str org-file-name)))
      (with-current-buffer buffer
	 (dolist (label blog-labels)
	    (gblogger-add-label label)))))

;;;_ , org2blog/atom:dir-add-new-photos
;;;###autoload
(defun org2blog/atom:dir-add-new-photos (directory album-name)
   "Add photos in a directory to specified album except those
that are already on a remote site"
   
   (interactive
      (list
         (read-directory-name "Directory: " default-directory nil t)
         (gphoto-choose-album)))
   (gphoto-directory-add-photos-x 
      directory 
      album-name
      #'(lambda (file)
	   (not (org2blog/common/l2r-remote-url file)))))


;;;_. Footers
;;;_ , Provides

(provide 'org2blog/atom/main)

;;;_ * Local emacs vars.
;;;_  + Local variables:
;;;_  + mode: allout
;;;_  + End:

;;;_ , End
;;; org2blog/atom/main.el ends here
