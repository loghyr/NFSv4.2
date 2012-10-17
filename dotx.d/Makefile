# Copyright (C) The IETF Trust (2011)

FORE_OPS_AS_IS1 = \
		access_args.x \
		access_res.x \
		close_args.x \
		close_res.x \
		commit_args.x \
		commit_res.x \
		create_args.x \
		create_res.x \
		delegpurge_args.x \
		delegpurge_res.x \
		delegreturn_args.x \
		delegreturn_res.x \
		getattr_args.x \
		getattr_res.x \
		getfh_res.x \
		link_args.x \
		link_res.x \
		lock_args.x \
		lock_res.x \
		lockt_args.x \
		lockt_res.x \
		locku_args.x \
		locku_res.x \
		lookup_args.x \
		lookup_res.x \
		lookupp_res.x \
		nverify_args.x \
		nverify_res.x

FORE_OPS_AS_IS2 = \
		open_res.x \
		openattr_args.x \
		openattr_res.x \
		open_confirm_args.x \
		open_confirm_res.x \
		open_downgrade_args.x \
		open_downgrade_res.x \
		putfh_args.x \
		putfh_res.x \
		putpubfh_res.x \
		putrootfh_res.x \
		read_args.x \
		read_res.x \
		readdir_args.x \
		readdir_res.x \
		readlink_res.x \
		remove_args.x \
		remove_res.x \
		rename_args.x \
		rename_res.x \
		renew_args.x \
		renew_res.x \
		restorefh_res.x \
		savefh_res.x \
		secinfo_args.x \
		secinfo_res.x \
		setattr_args.x \
		setattr_res.x \
		setclientid_args.x \
		setclientid_res.x \
		setclientid_confirm_args.x \
		setclientid_confirm_res.x \
		verify_args.x \
		verify_res.x \
		write_args.x \
		write_res.x \
		release_lockowner_args.x \
		release_lockowner_res.x \
		illegal_res.x \
		backchannel_ctl_args.x \
		backchannel_ctl_res.x \
		bind_conn_to_session_args.x \
		bind_conn_to_session_res.x \
		exchange_id_args.x \
		exchange_id_res.x \
		create_session_args.x \
		create_session_res.x \
		destroy_session_args.x \
		destroy_session_res.x \
		free_stateid_args.x \
		free_stateid_res.x \
		get_dir_delegation_args.x \
		get_dir_delegation_res.x \
		getdeviceinfo_args.x \
		getdeviceinfo_res.x \
		getdevicelist_args.x \
		getdevicelist_res.x \
		layoutcommit_args.x \
		layoutcommit_res.x \
		layoutget_args.x \
		layoutget_res.x \
		layoutreturn_args.x \
		layoutreturn_res.x \
		secinfo_no_name_args.x \
		secinfo_no_name_res.x \
		sequence_args.x \
		sequence_res.x \
		set_ssv_args.x \
		set_ssv_res.x \
		test_stateid_args.x \
		test_stateid_res.x \
		want_delegation_args.x \
		want_delegation_res.x \
		destroy_clientid_args.x \
		destroy_clientid_res.x \
                reclaim_complete_args.x \
                reclaim_complete_res.x \
                copy_args.x \
                copy_res.x \
                offload_abort_args.x \
                offload_abort_res.x \
                copy_notify_args.x \
                copy_notify_res.x \
                offload_revoke_args.x \
                offload_revoke_res.x \
                offload_status_args.x \
                offload_status_res.x \
		write_plus_args.x \
		write_plus_res.x \
		io_advise_args.x \
		io_advise_res.x \
		read_plus_args.x \
		read_plus_res.x \
		seek_args.x \
		seek_res.x

FORE_OPS = $(FORE_OPS_AS_IS1) open_args_gen.x $(FORE_OPS_AS_IS2)

FORE_OPS_SRC =  $(FORE_OPS_AS_IS1) open_args.x $(FORE_OPS_AS_IS2)

BACK_OPS =	cb_getattr_args.x \
		cb_getattr_res.x \
		cb_recall_args.x \
		cb_recall_res.x \
		cb_illegal_res.x \
		cb_layoutrecall_args.x \
		cb_layoutrecall_res.x \
		cb_notify_args.x \
		cb_notify_res.x \
		cb_push_deleg_args.x \
		cb_push_deleg_res.x \
		cb_recall_any_args.x \
		cb_recall_any_res.x \
		cb_recallable_obj_avail_args.x \
		cb_recallable_obj_avail_res.x \
		cb_recall_slot_args.x \
		cb_recall_slot_res.x \
		cb_sequence_args.x \
		cb_sequence_res.x \
		cb_wants_cancelled_args.x \
		cb_wants_cancelled_res.x \
		cb_notify_lock_args.x \
		cb_notify_lock_res.x \
		cb_notify_deviceid_args.x \
		cb_notify_deviceid_res.x \
		cb_offload_args.x \
		cb_offload_res.x

SPITGEN =	basic_types.x \
		type_nfstime4.x \
		type_nfsacl41.x \
		type_time_how4.x \
		type_settime4.x \
		type_fsid4.x \
		type_specdata4.x \
		type_chg_policy4.x \
		type_fs_location4.x \
		type_fs_locations4.x \
		type_fattr4.x \
		type_change_info4.x \
		type_netaddr4.x \
		type_state_owner4.x \
		type_open_to_lock_owner4.x \
		type_stateid4.x \
		type_layouttype4.x \
		type_deviceid4.x \
		type_nfl_util4.x \
		type_nfsv4_1_file_layouthint4.x \
		type_nfsv4_1_file_layout_ds_addr4.x \
		type_nfsv4_1_file_layout4.x \
		type_ssv_subkey4.x \
		type_ssv_mic_plain_tkn4.x \
		type_ssv_mic_tkn4.x \
		type_ssv_seal_plain_tkn4.x \
		type_ssv_seal_cipher_tkn4.x \
		type_layoutreturn4.x \
		type_layoutreturn_errs.x \
		type_client_owner4.x \
		type_server_owner4.x \
		type_device_addr4.x \
		type_layout_content4.x \
		type_layout4.x \
		type_layoutupdate4.x \
		type_layouthint4.x \
		type_layoutiomode4.x \
		type_nfs_impl_id4.x \
		type_threshold_item4.x \
		type_mdsthreshold4.x \
		type_retention_get4.x \
		type_retention_set4.x \
		type_acetype4.x \
		type_aceflag4.x \
		type_acemask4.x \
		type_nfsace4.x \
		type_fs4_status.x \
		type_fs_charset_cap4.x \
		const_acetype4.x \
		const_aceflag4.x \
		const_aclsupport4.x \
		const_acemask4.x \
		const_mode4.x \
		const_aclflag4.x \
		const_access_deny.x \
		const_sizes.x \
		type_nfs_cb_opnum4.x \
		type_nfs_cb_argop4.x \
		type_CB_COMPOUND4args.x \
		type_nfs_cb_resop4.x \
		type_CB_COMPOUND4res.x \
                type_nfs_opnum4.x \
                type_nfs_argop4.x \
		type_nfs_resop4.x \
		type_COMPOUND4args.x \
		type_COMPOUND4res.x \
		type_netloc_type4.x \
		copy_confirm_auth.x \
		copy_from_auth.x \
		copy_to_auth.x \
		app_data_hole4.x \
		data_info4.x \
		data_content4.x \
		type_chattr_type.x \
		type_label_format.x \
		type_change_label.x \
		stable_how4.x \
		write_response4.x

AUTOGEN =	hand_edit_warning.x \
		fore_ops.x \
		back_ops.x \
		$(SPITGEN) \
		open_args_gen.x

all:	nfsv42.x filelist

nfsv42.x: $(AUTOGEN) hand_edit_warning.x head.x fs_locations_info.x file_layout.x fore_ops.x layout_errors.x fore_prog.x \
		back_ops.x back_prog.x
	m4 hand_edit_warning.x head.x fs_locations_info.x file_layout.x fore_ops.x fore_prog.x back_ops.x back_prog.x | expand | tr -d "\r" > nfsv42.tmp
	mv nfsv42.tmp nfsv42.x

hand_edit_warning.x: Makefile ../Makefile head.x $(FORE_OPS) fore_prog.x $(BACK_OPS) back_prog.x
	( \
		echo "/*" ; \
		echo " * This file was machine generated for" ; \
                echo " *  draft-ietf-nfsv4-minorversion2-$(VERS)" ; \
		echo " * Last updated `date`" ; \
		echo " */" ; \
	)  > hand_edit_warning.x

open_args_gen.x: open_args.x const_access_deny.x
		rm -f $@ $@.tmp
		m4 open_args.x > $@.tmp
		mv $@.tmp $@

fore_ops.x: $(FORE_OPS) Makefile
	cat $(FORE_OPS) > fore_ops.x

back_ops.x: $(BACK_OPS) Makefile
	cat $(BACK_OPS) > back_ops.x

$(SPITGEN): spit_types.sh
	sh spit_types.sh $@

clean:
	$(RM) $(AUTOGEN) tmp.filelist

clobber:
	$(RM) nfsv42.x

filelist: Makefile
	echo "" > tmp.filelist ; \
	for f in Makefile spit_types.sh head.x fs_locations_info.x file_layout.x fore_prog.x back_prog.x $(FORE_OPS_SRC) $(BACK_OPS) ; do \
	echo dotx.d/$$f >> tmp.filelist ; \
	done
