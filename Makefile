# Copyright (C) The IETF Trust (2009-2010)
#
# Manage the .xml for the NFSv4 3530bis document.
#

YEAR=`date +%Y`
MONTH=`date +%B`
DAY=`date +%d`
PREVVERS=00
VERS=00
VPATH = dotx.d

autogen/%.xml : %.x
	@mkdir -p autogen
	@rm -f $@.tmp $@
	@( cd dotx.d ; m4 `basename $<` > ../$@.tmp )
	@cat $@.tmp | sed 's/^\%//' | sed 's/</\&lt;/g'| \
	awk ' \
		BEGIN	{ print "<figure>"; print" <artwork>"; } \
			{ print $0 ; } \
		END	{ print " </artwork>"; print"</figure>" ; } ' \
	| expand > $@
	@rm -f $@.tmp

all: html txt dotx dotx-txt

#
# Build the stuff needed to ensure integrity of document.
common: testx dotx html dotx-txt

txt: draft-ietf-nfsv4-minorversion2-$(VERS).txt

html: draft-ietf-nfsv4-minorversion2-$(VERS).html

nr: draft-ietf-nfsv4-minorversion2-$(VERS).nr

dotx:
	cd dotx.d ; VERS=$(VERS) $(MAKE) all

#
# Builds the I-D that has just the .x file
#
dotx-txt:
	cd dotx-id.d ; SPECVERS=$(VERS) $(MAKE) all

xml: draft-ietf-nfsv4-minorversion2-$(VERS).xml

clobber:
	$(RM) draft-ietf-nfsv4-minorversion2-$(VERS).txt \
		draft-ietf-nfsv4-minorversion2-$(VERS).html \
		draft-ietf-nfsv4-minorversion2-$(VERS).nr
	export SPECVERS := $(VERS)
	export VERS := $(VERS)
	cd dotx-id.d ; SPECVERS=$(VERS) $(MAKE) clobber
	cd dotx.d ; VERS=$(VERS) $(MAKE) clobber

clean:
	rm -f $(AUTOGEN)
	rm -rf autogen
	rm -f draft-ietf-nfsv4-minorversion2-$(VERS).xml
	rm -rf draft-$(VERS)
	rm -f draft-$(VERS).tar.gz
	rm -rf testx.d
	rm -rf draft-tmp.xml
	cd dotx.d ; VERS=$(VERS) $(MAKE) clean
	cd dotx-id.d ; SPECVERS=$(VERS) $(MAKE) clean

# Parallel All
pall: 
	$(MAKE) xml
	( $(MAKE) txt ; echo .txt done ) & \
	( $(MAKE) html ; echo .html done ) & \
	wait

draft-ietf-nfsv4-minorversion2-$(VERS).txt: draft-ietf-nfsv4-minorversion2-$(VERS).xml
	rm -f $@ draft-tmp.txt
	sh xml2rfc_wrapper.sh draft-ietf-nfsv4-minorversion2-$(VERS).xml draft-tmp.txt
	mv draft-tmp.txt $@

draft-ietf-nfsv4-minorversion2-$(VERS).html: draft-ietf-nfsv4-minorversion2-$(VERS).xml
	rm -f $@ draft-tmp.html
	sh xml2rfc_wrapper.sh draft-ietf-nfsv4-minorversion2-$(VERS).xml draft-tmp.html
	mv draft-tmp.html $@

draft-ietf-nfsv4-minorversion2-$(VERS).nr: draft-ietf-nfsv4-minorversion2-$(VERS).xml
	rm -f $@ draft-tmp.nr
	sh xml2rfc_wrapper.sh draft-ietf-nfsv4-minorversion2-$(VERS).xml $@.tmp
	mv draft-tmp.nr $@

nfsv4_middle_errortoop_autogen.xml: nfsv4_middle_errors.xml
	./errortbl < nfsv4_middle_errors.xml > nfsv4_middle_errortoop_autogen.xml

nfsv4_front_autogen.xml: nfsv4_front.xml Makefile
	sed -e s/DAYVAR/${DAY}/g -e s/MONTHVAR/${MONTH}/g -e s/YEARVAR/${YEAR}/g < nfsv4_front.xml > nfsv4_front_autogen.xml

nfsv4_rfc_start_autogen.xml: nfsv4_rfc_start.xml Makefile
	sed -e s/VERSIONVAR/${VERS}/g < nfsv4_rfc_start.xml > nfsv4_rfc_start_autogen.xml

autogen/basic_types.xml: dotx.d/spit_types.sh
	sh dotx.d/spit_types.sh $@

SPITGEN =	dotx.d/type_nfstime4.x \
		dotx.d/type_time_how4.x \
		dotx.d/type_settime4.x \
		dotx.d/type_fsid4.x \
		dotx.d/type_specdata4.x \
		dotx.d/type_fs_location4.x \
		dotx.d/type_fs_locations4.x \
		dotx.d/type_fattr4.x \
		dotx.d/type_change_info4.x \
		dotx.d/type_cb_client4.x \
		dotx.d/type_nfs_client_id4.x \
		dotx.d/type_open_owner4.x \
		dotx.d/type_lock_owner4.x \
		dotx.d/type_nfs_lock_type4.x \
		dotx.d/type_clientaddr4.x \
		dotx.d/type_state_owner4.x \
		dotx.d/type_open_to_lock_owner4.x \
		dotx.d/type_stateid4.x \
		dotx.d/type_acetype4.x \
		dotx.d/type_aceflag4.x \
		dotx.d/type_acemask4.x \
		dotx.d/type_nfsace4.x \
		dotx.d/const_acetype4.x \
		dotx.d/const_aceflag4.x \
		dotx.d/const_aclsupport4.x \
		dotx.d/const_acemask4.x \
		dotx.d/const_mode4.x \
		dotx.d/const_access_deny.x \
		dotx.d/const_sizes.x \
		dotx.d/type_nfs_cb_opnum4.x \
		dotx.d/type_nfs_cb_argop4.x \
		dotx.d/type_CB_COMPOUND4args.x \
		dotx.d/type_nfs_cb_resop4.x \
		dotx.d/type_CB_COMPOUND4res.x \
		dotx.d/type_nfs_opnum4.x \
		dotx.d/type_nfs_argop4.x \
		dotx.d/type_nfs_resop4.x \
		dotx.d/type_COMPOUND4args.x \
		dotx.d/type_COMPOUND4res.x

SPITGENXML =	autogen/type_nfstime4.xml \
		autogen/type_time_how4.xml \
		autogen/type_settime4.xml \
		autogen/type_fsid4.xml \
		autogen/type_specdata4.xml \
		autogen/type_fs_location4.xml \
		autogen/type_fs_locations4.xml \
		autogen/type_fattr4.xml \
		autogen/type_change_info4.xml \
		autogen/type_cb_client4.xml \
		autogen/type_nfs_client_id4.xml \
		autogen/type_open_owner4.xml \
		autogen/type_lock_owner4.xml \
		autogen/type_nfs_lock_type4.xml \
		autogen/type_clientaddr4.xml \
		autogen/type_state_owner4.xml \
		autogen/type_open_to_lock_owner4.xml \
		autogen/type_stateid4.xml \
		autogen/type_acetype4.xml \
		autogen/type_aceflag4.xml \
		autogen/type_acemask4.xml \
		autogen/type_nfsace4.xml \
		autogen/const_acetype4.xml \
		autogen/const_aceflag4.xml \
		autogen/const_aclsupport4.xml \
		autogen/const_acemask4.xml \
		autogen/const_mode4.xml \
		autogen/const_access_deny.xml \
		autogen/const_sizes.xml \
		autogen/type_nfs_cb_opnum4.xml \
		autogen/type_nfs_cb_argop4.xml \
		autogen/type_CB_COMPOUND4args.xml \
		autogen/type_nfs_cb_resop4.xml \
		autogen/type_CB_COMPOUND4res.xml \
		autogen/cb_getattr_args.xml \
		autogen/cb_getattr_res.xml \
		autogen/cb_recall_args.xml \
		autogen/cb_recall_res.xml \
		autogen/cb_illegal_res.xml \
		autogen/type_nfs_opnum4.xml \
		autogen/type_nfs_argop4.xml \
		autogen/type_nfs_resop4.xml \
		autogen/type_COMPOUND4args.xml \
		autogen/type_COMPOUND4res.xml \
		autogen/setclientid_args.xml \
		autogen/access_args.xml \
		autogen/access_res.xml \
		autogen/close_args.xml \
		autogen/close_res.xml \
		autogen/commit_args.xml \
		autogen/commit_res.xml \
		autogen/create_args.xml \
		autogen/create_res.xml \
		autogen/delegpurge_args.xml \
		autogen/delegpurge_res.xml \
		autogen/delegreturn_args.xml \
		autogen/delegreturn_res.xml \
		autogen/getattr_args.xml \
		autogen/getattr_res.xml \
		autogen/getfh_res.xml \
		autogen/link_args.xml \
		autogen/link_res.xml \
		autogen/lock_args.xml \
		autogen/lock_res.xml \
		autogen/lockt_args.xml \
		autogen/lockt_res.xml \
		autogen/locku_args.xml \
		autogen/locku_res.xml \
		autogen/lookup_args.xml \
		autogen/lookup_res.xml \
		autogen/lookupp_res.xml \
		autogen/nverify_args.xml \
		autogen/nverify_res.xml \
		autogen/open_args.xml \
		autogen/open_res.xml \
		autogen/openattr_args.xml \
		autogen/openattr_res.xml \
		autogen/open_confirm_args.xml \
		autogen/open_confirm_res.xml \
		autogen/open_downgrade_args.xml \
		autogen/open_downgrade_res.xml \
		autogen/putfh_args.xml \
		autogen/putfh_res.xml \
		autogen/putpubfh_res.xml \
		autogen/putrootfh_res.xml \
		autogen/read_args.xml \
		autogen/read_res.xml \
		autogen/readdir_args.xml \
		autogen/readdir_res.xml \
		autogen/readlink_res.xml \
		autogen/remove_args.xml \
		autogen/remove_res.xml \
		autogen/rename_args.xml \
		autogen/rename_res.xml \
		autogen/renew_args.xml \
		autogen/renew_res.xml \
		autogen/restorefh_res.xml \
		autogen/savefh_res.xml \
		autogen/secinfo_args.xml \
		autogen/secinfo_res.xml \
		autogen/setattr_args.xml \
		autogen/setattr_res.xml \
		autogen/setclientid_args.xml \
		autogen/setclientid_res.xml \
		autogen/setclientid_confirm_args.xml \
		autogen/setclientid_confirm_res.xml \
		autogen/verify_args.xml \
		autogen/verify_res.xml \
		autogen/write_args.xml \
		autogen/write_res.xml \
		autogen/release_lockowner_args.xml \
		autogen/release_lockowner_res.xml \
		autogen/illegal_res.xml


$(SPITGEN): dotx.d/spit_types.sh
	cd dotx.d ; sh spit_types.sh `basename $@`


dotx.d/open_args_gen.x: dotx.d/open_args.x dotx.d/const_access_deny.x
	cd dotx.d ; VERS=$(VERS) $(MAKE) `basename $@`

AUTOGEN =	\
		nfsv4_front_autogen.xml \
		nfsv4_rfc_start_autogen.xml \
		nfsv4_middle_errortoop_autogen.xml \
		autogen/basic_types.xml \
		$(SPITGEN) \
		$(SPITGENXML) \
		autogen/write_args.xml \
		autogen/write_res.xml

VESTIGIAL = \
	nfsv4_middle_op_open_confirm.xml \
	nfsv4_middle_op_renew.xml \
	nfsv4_middle_op_setclientid.xml \
	nfsv4_middle_op_setclientid_confirm.xml \
	nfsv4_middle_op_release_lockowner.xml

START_PREGEN = nfsv4_rfc_start.xml
START=	nfsv4_rfc_start_autogen.xml
END=	nfsv4_rfc_end.xml

FRONT_PREGEN = nfsv4_front.xml

IDXMLSRC_BASE = \
	nfsv4_middle_start.xml \
	nfsv4_middle_introduction.xml \
	nfsv4_middle_data_types.xml \
	nfsv4_middle_rpc_sec.xml \
	nfsv4_middle_filehandles.xml \
	nfsv4_middle_fileattributes.xml \
	nfsv4_middle_fileattributes_acls.xml \
        nfsv4_middle_mars.xml \
	nfsv4_middle_server_name.xml \
        nfsv4_middle_file_locking.xml \
	nfsv4_middle_client_cache.xml \
	nfsv4_middle_minor.xml \
	nfsv4_middle_i18n.xml \
	nfsv4_middle_errors.xml \
	nfsv4_middle_requests.xml \
	nfsv4_middle_procedures.xml \
	nfsv4_middle_cbs.xml \
        nfsv4_middle_security.xml \
	nfsv4_middle_iana.xml \
	nfsv4_middle_end.xml \
	nfsv4_back_front.xml \
	nfsv4_back_references.xml \
	nfsv4_back_acks.xml \
	nfsv4_back_back.xml

IDCONTENTS = nfsv4_front_autogen.xml $(IDXMLSRC_BASE)

IDXMLSRC = nfsv4_front.xml $(IDXMLSRC_BASE)

draft-tmp.xml: $(START) Makefile $(END)
		rm -f $@ $@.tmp
		cp $(START) $@.tmp
		chmod +w $@.tmp
		for i in $(IDCONTENTS) ; do echo '<?rfc include="'$$i'"?>' >> $@.tmp ; done
		cat $(END) >> $@.tmp
		mv $@.tmp $@

draft-ietf-nfsv4-minorversion2-$(VERS).xml: draft-tmp.xml $(IDCONTENTS) $(AUTOGEN)
		rm -f $@
		cp draft-tmp.xml $@

genhtml: Makefile gendraft html txt dotx dotx-txt draft-$(VERS).tar
	./gendraft draft-$(PREVVERS) \
		draft-ietf-nfsv4-minorversion2-$(PREVVERS).txt \
		draft-$(VERS) \
		draft-ietf-nfsv4-minorversion2-$(VERS).txt \
		draft-ietf-nfsv4-minorversion2-$(VERS).html \
		dotx.d/nfsv4.x \
		draft-ietf-nfsv4-minorversion2-dot-x-04.txt \
		draft-ietf-nfsv4-minorversion2-dot-x-05.txt \
		draft-$(VERS).tar.gz

testx: 
	rm -rf testx.d
	mkdir testx.d
	$(MAKE) dotx
	cp dotx.d/nfsv4.x testx.d
	( cd testx.d ; \
		rpcgen -a nfsv4.x ; \
		$(MAKE) -f make* )

spellcheck: $(IDXMLSRC)
	for f in $(IDXMLSRC); do echo "Spell Check of $$f"; spell +dictionary.txt $$f; done
	cd dotx-id.d ; SPECVERS=$(VERS) $(MAKE) spellcheck

AUXFILES = \
	dictionary.txt \
	gendraft \
	Makefile \
	errortbl \
	rfcdiff \
	xml2rfc_wrapper.sh \
	xml2rfc

DRAFTFILES = \
	draft-ietf-nfsv4-minorversion2-$(VERS).txt \
	draft-ietf-nfsv4-minorversion2-$(VERS).html \
	draft-ietf-nfsv4-minorversion2-$(VERS).xml

draft-$(VERS).tar: $(IDCONTENTS) $(START_PREGEN) $(FRONT_PREGEN) $(AUXFILES) $(DRAFTFILES) dotx.d/nfsv4.x
	rm -f draft-$(VERS).tar.gz
	tar -cvf draft-$(VERS).tar \
		$(START_PREGEN) \
		$(END) \
		$(FRONT_PREGEN) \
		$(IDCONTENTS) \
		$(AUXFILES) \
		$(DRAFTFILES) \
		`cat dotx.d/tmp.filelist` \
		`cat dotx-id.d/tmp.filelist`; \
		gzip draft-$(VERS).tar
