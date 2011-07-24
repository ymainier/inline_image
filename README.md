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
Brief usage description
    inline_image help inline

Replace all image in a css file appearing in `url(img/name.png)` (max size 1024B)

    inline_image inline /path/to/your.css

Replace all image in an html file appearing in `url(img/name.png)` (max size 1024B)

    inline_image inline /path/to/your.html

Replace all image in a file with max size 2048B

    inline_image inline /path/to/your_file --size=2048
    inline_image inline /path/to/your_file -s 2048

License
-------
Released under The Unlicense, aka public domain. See the [LICENSE][license] file for further details.

[license]: http://unlicense.org/
