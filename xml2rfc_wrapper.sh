#!/bin/sh
# $Id: xml2rfc_wrapper.sh,v 1.2 2008/05/23 23:57:37 mre Exp $	 

# The point of this rigamorole is that not all tclsh
# versions are equal. If your IT department has the wrong
# tclsh for xml2rfc, use the XML2RFCPATH environment variable
# to give to a better one. E.g., one of the editors
# has /u/mre/bin/rfc at the start of his XML2RFCPATH
# variables.

if [ "$XML2RFCPATH" != "" ]
then
	PATH=$XML2RFCPATH
	export PATH
fi

exec ${XML2RFCDOT}./xml2rfc-1.34/xml2rfc.tcl $*
