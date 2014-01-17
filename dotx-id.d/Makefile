# Copyright (C) The IETF Trust (2011-2013)
# Manage the .xml for the NFSv4 minor version document.
#

YEAR=`date +%Y`
MONTH=`date +%B`
DAY=`date +%d`
PREVVERS=20
VERS=21
VPATH = ../../dotx.d

all: txt filelist

txt: draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).txt

dotx:
	cd ../dotx.d ; VERS=$(SPECVERS) make all

XML2RFC=xml2rfc.tcl

xml: draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml

clobber:
	$(RM) draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).txt \
		draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).nr \
		nfsv42.x

clean:
	rm -f $(AUTOGEN)
	rm -rf autogen
	rm -f draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml
	rm -rf draft-$(VERS)
	rm -f draft-$(VERS).tar.gz
	rm -rf testx.d
	rm -f tmp.out tmp.sh tmp.x tmp.txt
	cd ../dotx.d ; make clean

# Parallel All
pall: 
	make xml
	( make txt ; echo .txt done ) & \
	wait

tmp.x:	tmp.txt
	rm -f tmp.x tmp.sh
	@# xml2rfc puts ^Ms at the end of each line.
	grep -w grep tmp.txt | grep -w sed | grep /// | tr -d "\r" > tmp.sh
	sh tmp.sh < tmp.txt > tmp.x

tmp.txt: draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml
	rm -f tmp.txt tmp2.txt
	XML2RFCDOT="." $(XML2RFC) draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml tmp2.txt
	mv -f tmp2.txt tmp.txt

draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).txt: tmp.txt tmp.x
	rm -f tmp.out
	diff ../dotx.d/nfsv42.x tmp.x > tmp.out
	@if [ -s tmp.out ] ; then \
	  echo ; \
	  echo .x file in i-d differs from ../dotx.d/nfsv42.x. Aborting. ; \
	  echo ; \
	  exit 1 ; \
	fi
	rm -f tmp.out

	cp tmp.txt $@

draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).nr: draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml
	XML2RFCDOT="." $(XML2RFC) draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml $@

dotx_front_autogen.xml: dotx_front.xml Makefile
	sed -e s/DAYVAR/${DAY}/g -e s/MONTHVAR/${MONTH}/g -e s/YEARVAR/${YEAR}/g < dotx_front.xml > dotx_front_autogen.xml

dotx_rfc_start_autogen.xml: dotx_rfc_start.xml Makefile
	sed -e s/VERSIONVAR/${VERS}/g < dotx_rfc_start.xml > dotx_rfc_start_autogen.xml

autogen/basic_types.xml: ../dotx.d/spit_types.sh
	sh ../dotx.d/spit_types.sh $@

AUTOGEN =	\
		dotx_front_autogen.xml \
		dotx_rfc_start_autogen.xml \
		dotx_autogen.xml

../dotx.d/nfsv42.x: dotx

dotx_autogen.xml: Makefile ../dotx.d/nfsv42.x
	@rm -f $@.tmp $@
	@cat ../dotx.d/nfsv42.x | sed 's?^?   /// ?' | sed 's/</\&lt;/g'| \
	awk ' \
		BEGIN	{ print "<figure>"; print" <artwork>"; } \
			{ print $0 ; } \
		END	{ print " </artwork>"; print"</figure>" ; } ' \
	| expand > $@.tmp
	mv $@.tmp $@

START_PREGEN = dotx_rfc_start.xml
START=	dotx_rfc_start_autogen.xml
END=	dotx_rfc_end.xml

FRONT_PREGEN = dotx_front.xml

IDXMLSRC_BASE = \
	dotx_middle_start.xml \
	dotx_middle_body.xml \
	dotx_middle_security_considerations.xml \
	dotx_middle_iana_considerations.xml \
	dotx_middle_end.xml \
	dotx_back_front.xml \
	dotx_back_references.xml \
	dotx_back_back.xml

IDCONTENTS = dotx_front_autogen.xml $(IDXMLSRC_BASE)

IDXMLSRC = dotx_front.xml $(IDXMLSRC_BASE)

draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml: Makefile $(START) $(IDCONTENTS) $(END) $(AUTOGEN)
		rm -f $@ $@.tmp
		cp $(START) $@.tmp
		chmod +w $@.tmp
		for i in $(IDCONTENTS) ; do echo '<?rfc include="'$$i'"?>' >> $@.tmp ; done
		cat $(END) >> $@.tmp
		mv $@.tmp $@

spellcheck: $(IDXMLSRC)
	for f in $(IDXMLSRC); do echo "Spell Check of $$f"; spell +../dictionary.txt $$f; done

AUXFILES = \
	../dictionary.txt \
	../gendraft \
	../Makefile \
	../errortbl \
	../rfcdiff \
	../xml2rfc

DRAFTFILES = \
	draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).txt \
	draft-ietf-nfsv4-minorversion2-dot-x-$(VERS).xml

draft-$(VERS).tar: $(IDCONTENTS) $(START_PREGEN) $(FRONT_PREGEN) $(AUXFILES) $(DRAFTFILES) dotx
	rm -f draft-$(VERS).tar.gz
	tar -cvf draft-$(VERS).tar $(START_PREGEN) $(END) $(FRONT_PREGEN) $(IDCONTENTS) $(AUXFILES) $(DRAFTFILES) ../dotx.d; gzip draft-$(VERS).tar

filelist: Makefile
	echo "" > tmp.filelist ; \
	for f in Makefile $(START_PREGEN) $(END) $(FRONT_PREGEN) $(IDCONTENTS) ; do \
	echo dotx-id.d/$$f >> tmp.filelist ; \
	done
