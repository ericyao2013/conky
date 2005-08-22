#!/bin/sh
# $Id$

xsltproc http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl docs.xml > docs.html
if [ -x docbook2man ]
then
	docbook2man docs.xml
else
	docbook2x-man docs.xml
fi
gzip -f conky.1
man ./conky.1.gz | col -b > README
mv README ../
