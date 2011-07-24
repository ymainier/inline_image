InlineImage
===========

Description
-----------
Inline image parses css and html files to replace small file by a data URI reprentation in base64. Small files are files shorter than 1024 bytes by default.
File type must be either css or html. Extension is used to determine file type, _so it is important that your file end with .css or .html_
If file extension does not match either html or css, html will be used.

Installation
------------
    gem install inline_image

Usage and documentation
-----------------------
    inline_image inline /path/to/your.css # search for url(img/name.png)
    inline_image inline /path/to/your.html # search for src="img/name.png"
    inline_image help inline # Brief usage description

Todo
----
Add option to specify how small the file must be transformed

License
-------
Released under The Unlicense, aka public domain. See the [LICENSE][license] file for further details.

[license]: http://unlicense.org/
