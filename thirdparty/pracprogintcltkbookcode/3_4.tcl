#
# Example 3-4
# The Cgi_Header procedure.
#

proc Cgi_Header {title {body {bgcolor=white text=black}}} {
    puts stdout "Content-Type: text/html

<HTML>
<HEAD>
<TITLE>$title</TITLE>
</HEAD>
<BODY $body>
<H1>$title</H1>"
}


