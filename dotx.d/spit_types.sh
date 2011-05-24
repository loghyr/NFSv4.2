#!/bin/sh
# Copyright (C) The IETF Trust (2007-2011)

for i in $* ;
do
	case $i in

	autogen/basic_types.xml | basic_types.x )

	if [ "$tmp" = "" ]
	then
		tmp=t$$

cat << EOF > $tmp
typedef :int:int32_t
typedef :unsigned int:uint32_t
typedef :hyper:int64_t
typedef :unsigned hyper:uint64_t
typedef :opaque:attrlist4<>:Used for file/directory attributes.
typedef :uint32_t:bitmap4<>:Used in attribute array encoding.
typedef :uint64_t:changeid4:Used in the definition of change_info4.
typedef :uint64_t:clientid4:Shorthand reference to client identification.
typedef :uint32_t:count4:Various count parameters (READ, WRITE, COMMIT).
typedef :uint64_t:length4:Describes LOCK lengths.
typedef :uint32_t:mode4:Mode attribute data type.
typedef :uint64_t:nfs_cookie4:Opaque cookie value for READDIR.
typedef :opaque:nfs_fh4<NFS4_FHSIZE>:Filehandle definition.
:enum:nfs_ftype4:Various defined file types.
:enum:nfsstat4:Return value for operations.
typedef :uint64_t:offset4:Various offset designations (READ, WRITE, LOCK, COMMIT).
typedef :uint32_t:qop4:Quality of protection designation in SECINFO.
typedef :opaque:sec_oid4<>:Security Object Identifier. The sec_oid4 data type is not really opaque. Instead it contains an ASN.1 OBJECT IDENTIFIER as used by GSS-API in the mech_type argument to GSS_Init_sec_context. See <xref target="RFC2743" /> for details.
typedef :uint32_t:sequenceid4:Sequence number used for various session operations (EXCHANGE_ID, CREATE_SESSION, SEQUENCE, CB_SEQUENCE).
typedef :uint32_t:seqid4:Sequence identifier used for file locking.
typedef :opaque:sessionid4[NFS4_SESSIONID_SIZE]:Session identifier.
typedef :uint32_t:slotid4:Sequencing artifact for various session operations (SEQUENCE, CB_SEQUENCE).
typedef :opaque:utf8string<>:UTF-8 encoding for strings.
typedef :utf8string:utf8str_cis:Case-insensitive UTF-8 string.
typedef :utf8string:utf8str_cs:Case-sensitive UTF-8 string.
typedef :utf8string:utf8str_mixed:UTF-8 strings with a case sensitive prefix and a case insensitive suffix.
typedef :utf8str_cs:component4:Represents path name components.
typedef :utf8str_cs:linktext4:Symbolic link contents.
typedef :component4:pathname4<>:Represents path name for fs_locations.
typedef :opaque:verifier4[NFS4_VERIFIER_SIZE]:Verifier used for various operations (COMMIT, CREATE, EXCHANGE_ID, OPEN, READDIR, WRITE) NFS4_VERIFIER_SIZE is defined as 8.
:enum:netloc_type4:Specifies network locations.
typedef :string:secret4<>:Secret value to share between servers.
typedef :uint32_t:policy4:Label formt specifier or policy identifier.
EOF

	fi

	if [ $i = autogen/basic_types.xml ]
	then
		mkdir -p autogen

		cat $tmp | sed 's/<xref/qdfuixref/g' | sed 's/</\&lt;/g' |
		awk -F: '
			{
				i = index($3, "&lt;");
				if (i == 0) {
					i = index($3, "[");
				};
				if (i != 0) {
					type_name = substr($3, 1, i - 1);
				} else {
					type_name = $3;
				}

				printf "\t<c>%s</c>\t\t<c>%s%s %s;</c>\n", type_name, $1, $2, $3 ;
				if (NF > 3) {
					printf "\t<c/>\t<c>%s</c>\n", $4 ;
				}
				printf "\n";
			}

		' | sed 's/qdfuixref/<xref/g' > $i
	else
		cat $tmp | awk -F: '
			NR >= 5 {
				if ($1 != "") {
					printf "%s%s\t%s;\n", $1, $2, $3;
				}
			}
		' > $@

	fi


	;;

	const_sizes.x )

cat << EOF > $i
const NFS4_FHSIZE		= 128;
const NFS4_VERIFIER_SIZE	= 8;
const NFS4_OPAQUE_LIMIT		= 1024;
const NFS4_SESSIONID_SIZE	= 16;

const NFS4_INT64_MAX		= 0x7fffffffffffffff;
const NFS4_UINT64_MAX		= 0xffffffffffffffff;
const NFS4_INT32_MAX		= 0x7fffffff;
const NFS4_UINT32_MAX		= 0xffffffff;

const NFS4_MAXFILELEN		= 0xffffffffffffffff;
const NFS4_MAXFILEOFF		= 0xfffffffffffffffe;
EOF

	;;

	type_nfstime4.x )

cat << EOF > $i
struct nfstime4 {
	int64_t		seconds;
	uint32_t	nseconds;
};
EOF
	;;

	type_time_how4.x )

cat << EOF > $i
enum time_how4 {
	SET_TO_SERVER_TIME4 = 0,
	SET_TO_CLIENT_TIME4 = 1
};
EOF
	;;

	type_settime4.x )


cat << EOF > $i
union settime4 switch (time_how4 set_it) {
 case SET_TO_CLIENT_TIME4:
	 nfstime4	time;
 default:
	 void;
};
EOF
	;;

	type_fsid4.x )


cat << EOF > $i
struct fsid4 {
	uint64_t	major;
	uint64_t	minor;
};
EOF
	;;

	type_specdata4.x )


cat << EOF > $i
struct specdata4 {
 uint32_t specdata1; /* major device number */
 uint32_t specdata2; /* minor device number */
};
EOF
	;;

	type_chg_policy4.x )


cat << EOF > $i
struct change_policy4 {
	uint64_t	cp_major;
	uint64_t	cp_minor;
};
EOF
	;;

	type_fs_location4.x )


cat << EOF > $i
struct fs_location4 {
	utf8str_cis	server<>;
	pathname4	rootpath;
};
EOF
	;;

	type_fs_locations4.x )


cat << EOF > $i
struct fs_locations4 {
	pathname4	fs_root;
	fs_location4	locations<>;
};
EOF
	;;

	type_fattr4.x )


cat << EOF > $i
struct fattr4 {
	bitmap4		attrmask;
	attrlist4	attr_vals;
};
EOF
	;;

	type_change_info4.x )


cat << EOF > $i
struct change_info4 {
	bool		atomic;
	changeid4	before;
	changeid4	after;
};
EOF
	;;

	type_netaddr4.x )


cat << EOF > $i
struct netaddr4 {
	/* see struct rpcb in RFC 1833 */
	string na_r_netid<>;	/* network id */
	string na_r_addr<>;	/* universal address */
};
EOF
	;;

	type_state_owner4.x )


cat << EOF > $i
struct state_owner4 {
	clientid4	clientid;
	opaque		owner<NFS4_OPAQUE_LIMIT>;
};

typedef state_owner4 open_owner4;
typedef state_owner4 lock_owner4;
EOF
	;;

	type_open_to_lock_owner4.x )


cat << EOF > $i
struct open_to_lock_owner4 {
	seqid4		open_seqid;
	stateid4	open_stateid;
	seqid4		lock_seqid;
	lock_owner4	lock_owner;
};
EOF
	;;

	type_stateid4.x )

cat << EOF > $i
struct stateid4 {
	uint32_t	seqid;
	opaque		other[12];
};
EOF
	;;

	type_layouttype4.x )

cat << EOF > $i
enum layouttype4 {
	LAYOUT4_NFSV4_1_FILES	= 0x1,
	LAYOUT4_OSD2_OBJECTS	= 0x2,
	LAYOUT4_BLOCK_VOLUME	= 0x3
};
EOF
	;;

	type_deviceid4.x )

cat << EOF > $i
const NFS4_DEVICEID4_SIZE = 16;

typedef opaque  deviceid4[NFS4_DEVICEID4_SIZE];
EOF
	;;


	type_nfl_util4.x )

cat << EOF > $i
const NFL4_UFLG_MASK		= 0x0000003F;
const NFL4_UFLG_DENSE		= 0x00000001;
const NFL4_UFLG_COMMIT_THRU_MDS	= 0x00000002;
const NFL4_UFLG_STRIPE_UNIT_SIZE_MASK
				= 0xFFFFFFC0;

typedef uint32_t nfl_util4;
EOF
	;;

	type_nfsv4_1_file_layouthint4.x )

cat << EOF > $i
enum filelayout_hint_care4 {
	NFLH4_CARE_DENSE	= NFL4_UFLG_DENSE,

	NFLH4_CARE_COMMIT_THRU_MDS
				= NFL4_UFLG_COMMIT_THRU_MDS,

	NFLH4_CARE_STRIPE_UNIT_SIZE
				= 0x00000040,

	NFLH4_CARE_STRIPE_COUNT	= 0x00000080
};
%
%/*
% * Encoded in the loh_body field of data type layouthint4:
%*/
%
struct nfsv4_1_file_layouthint4 {
        uint32_t        nflh_care;
	nfl_util4	nflh_util;
	count4		nflh_stripe_count;
};
EOF
	;;

	type_nfsv4_1_file_layout_ds_addr4.x )

cat << EOF > $i
%
typedef netaddr4 multipath_list4<>;
%
%/*
% * Encoded in the da_addr_body field of data type device_addr4:
%*/
struct nfsv4_1_file_layout_ds_addr4 {
	uint32_t	nflda_stripe_indices<>;
	multipath_list4	nflda_multipath_ds_list<>;
};
EOF
	;;

	type_nfsv4_1_file_layout4.x )

cat << EOF > $i
%
%/*
% * Encoded in the loc_body field of data type layout_content4:
%*/
struct nfsv4_1_file_layout4 {
	 deviceid4	nfl_deviceid;
	 nfl_util4	nfl_util;
	 uint32_t	nfl_first_stripe_index;
	 offset4	nfl_pattern_offset;
         nfs_fh4      	nfl_fh_list<>;
};
EOF
	;;

	type_ssv_subkey4.x )

cat << EOF > $i
%
%/* Input for computing subkeys */
enum ssv_subkey4 {
	SSV4_SUBKEY_MIC_I2T	= 1,
	SSV4_SUBKEY_MIC_T2I	= 2,
	SSV4_SUBKEY_SEAL_I2T	= 3,
	SSV4_SUBKEY_SEAL_T2I	= 4
};
%
EOF
	;;


	type_ssv_mic_plain_tkn4.x )

cat << EOF > $i
%
%/* Input for computing smt_hmac */
struct ssv_mic_plain_tkn4 {
  uint32_t        smpt_ssv_seq;
  opaque          smpt_orig_plain<>;
};
%
EOF
	;;

	type_ssv_mic_tkn4.x )
cat << EOF > $i
%
%/* SSV GSS PerMsgToken token */
struct ssv_mic_tkn4 {
  uint32_t        smt_ssv_seq;
  opaque          smt_hmac<>;
};
%
EOF
	;;

	type_ssv_seal_plain_tkn4.x )

cat << EOF > $i
%
%/* Input for computing ssct_encr_data and ssct_hmac */
struct ssv_seal_plain_tkn4 {
  opaque          sspt_confounder<>;
  uint32_t        sspt_ssv_seq;
  opaque          sspt_orig_plain<>;
  opaque          sspt_pad<>;
};
%
EOF
	;;

	type_ssv_seal_cipher_tkn4.x )

cat << EOF > $i
%
%/* SSV GSS SealedMessage token */
struct ssv_seal_cipher_tkn4 {
  uint32_t      ssct_ssv_seq;
  opaque        ssct_iv<>;
  opaque        ssct_encr_data<>;
  opaque        ssct_hmac<>;
};
%
EOF
	;;

	type_layoutreturn4.x )

cat << EOF > $i
%
/* Constants used for LAYOUTRETURN and CB_LAYOUTRECALL */
const LAYOUT4_RET_REC_FILE		= 1;
const LAYOUT4_RET_REC_FSID		= 2;
const LAYOUT4_RET_REC_ALL		= 3;
%
enum layoutreturn_type4 {
	LAYOUTRETURN4_FILE = LAYOUT4_RET_REC_FILE,
	LAYOUTRETURN4_FSID = LAYOUT4_RET_REC_FSID,
	LAYOUTRETURN4_ALL  = LAYOUT4_RET_REC_ALL
};

struct layoutreturn_file4 {
	offset4		lrf_offset;
	length4		lrf_length;
        stateid4        lrf_stateid;
%	/* layouttype4 specific data */
	opaque		lrf_body<>;
};

union layoutreturn4 switch(layoutreturn_type4 lr_returntype) {
	case LAYOUTRETURN4_FILE:
		layoutreturn_file4	lr_layout;
	default:
		void;
};
%
EOF
        ;;

	type_layoutreturn_errs.x )

cat << EOF > $i
struct layoutreturn_device_error4 {
	deviceid4	lrde_deviceid;
	nfsstat4	lrde_status;
	nfs_opnum4	lrde_opnum;
};

struct layoutreturn_error_report4 {
	layoutreturn_device_error4	lrer_errors<>;
};
EOF
        ;;

	type_client_owner4.x )

cat << EOF > $i
struct client_owner4 {
	verifier4	co_verifier;
	opaque		co_ownerid<NFS4_OPAQUE_LIMIT>;
};
EOF
	;;

	type_server_owner4.x )

cat << EOF > $i
struct server_owner4 {
 uint64_t	so_minor_id;
 opaque		so_major_id<NFS4_OPAQUE_LIMIT>;
};
EOF
	;;

	type_device_addr4.x )

cat << EOF > $i
struct device_addr4 {
	layouttype4		da_layout_type;
	opaque			da_addr_body<>;
};
EOF
	;;

	type_layout_content4.x )

cat << EOF > $i
struct layout_content4 {
	layouttype4 loc_type;
	opaque      loc_body<>;
};
EOF
	;;

	type_layout4.x )

cat << EOF > $i
struct layout4 {
	offset4			lo_offset;
	length4			lo_length;
	layoutiomode4		lo_iomode;
	layout_content4		lo_content;
};
EOF
	;;

	type_layoutupdate4.x )

cat << EOF > $i
struct layoutupdate4 {
	layouttype4		lou_type;
	opaque			lou_body<>;
};
EOF
	;;

	type_layouthint4.x )

cat << EOF > $i
struct layouthint4 {
	layouttype4		loh_type;
	opaque			loh_body<>;
};
EOF
	;;

	type_layoutiomode4.x )

cat << EOF > $i
enum layoutiomode4 {
	LAYOUTIOMODE4_READ	= 1,
	LAYOUTIOMODE4_RW	= 2,
	LAYOUTIOMODE4_ANY	= 3
};
EOF
	;;

	type_nfs_impl_id4.x )

cat << EOF > $i
struct nfs_impl_id4 {
	utf8str_cis   nii_domain;
	utf8str_cs    nii_name;
	nfstime4      nii_date;
};
EOF
	;;

	type_threshold_item4.x )

cat << EOF > $i
struct threshold_item4 {
	layouttype4	thi_layout_type;
	bitmap4		thi_hintset;
	opaque		thi_hintlist<>;
};
EOF
	;;

	type_mdsthreshold4.x )

cat << EOF > $i
struct mdsthreshold4 {
	threshold_item4 mth_hints<>;
};
EOF
	;;

	type_retention_get4.x )

cat << EOF > $i
const RET4_DURATION_INFINITE	= 0xffffffffffffffff;
struct retention_get4 {
	uint64_t	rg_duration;
	nfstime4	rg_begin_time<1>;
};
EOF
	;;

	type_retention_set4.x )

cat << EOF > $i
struct retention_set4 {
	bool		rs_enable;
	uint64_t	rs_duration<1>;
};
EOF
	;;

	type_acetype4.x )

cat << EOF > $i
typedef uint32_t	acetype4;
EOF
	;;

	type_aceflag4.x )

cat << EOF > $i
typedef uint32_t aceflag4;
EOF
	;;

	type_acemask4.x )

cat << EOF > $i
typedef uint32_t	acemask4;
EOF
	;;

	type_nfsace4.x )

cat << EOF > $i
struct nfsace4 {
	acetype4	type;
	aceflag4	flag;
	acemask4	access_mask;
	utf8str_mixed	who;
};
EOF
	;;

	type_fs4_status.x )

cat << EOF > $i
enum fs4_status_type {
	STATUS4_FIXED = 1,
	STATUS4_UPDATED = 2,
	STATUS4_VERSIONED = 3,
	STATUS4_WRITABLE = 4,
	STATUS4_REFERRAL = 5
};

struct fs4_status {
        bool            fss_absent;
	fs4_status_type fss_type;
	utf8str_cs	fss_source;
	utf8str_cs	fss_current;
	int32_t		fss_age;
	nfstime4	fss_version;
};
EOF
	;;

	type_fs_charset_cap4.x )

cat << EOF > $i
const FSCHARSET_CAP4_CONTAINS_NON_UTF8	= 0x1;
const FSCHARSET_CAP4_ALLOWS_ONLY_UTF8	= 0x2;

typedef uint32_t	fs_charset_cap4;
EOF
	;;


	const_acetype4.x )

cat << EOF > $i
const ACE4_ACCESS_ALLOWED_ACE_TYPE	= 0x00000000;
const ACE4_ACCESS_DENIED_ACE_TYPE	= 0x00000001;
const ACE4_SYSTEM_AUDIT_ACE_TYPE	= 0x00000002;
const ACE4_SYSTEM_ALARM_ACE_TYPE	= 0x00000003;
EOF
	;;

	const_aceflag4.x )

cat << EOF > $i
const ACE4_FILE_INHERIT_ACE		= 0x00000001;
const ACE4_DIRECTORY_INHERIT_ACE	= 0x00000002;
const ACE4_NO_PROPAGATE_INHERIT_ACE	= 0x00000004;
const ACE4_INHERIT_ONLY_ACE		= 0x00000008;
const ACE4_SUCCESSFUL_ACCESS_ACE_FLAG	= 0x00000010;
const ACE4_FAILED_ACCESS_ACE_FLAG	= 0x00000020;
const ACE4_IDENTIFIER_GROUP		= 0x00000040;
const ACE4_INHERITED_ACE		= 0x00000080;
EOF
	;;

	const_aclsupport4.x )

cat << EOF > $i
const ACL4_SUPPORT_ALLOW_ACL	= 0x00000001;
const ACL4_SUPPORT_DENY_ACL	= 0x00000002;
const ACL4_SUPPORT_AUDIT_ACL	= 0x00000004;
const ACL4_SUPPORT_ALARM_ACL	= 0x00000008;
EOF
	;;

	const_acemask4.x )

cat << EOF > $i
const ACE4_READ_DATA		= 0x00000001;
const ACE4_LIST_DIRECTORY	= 0x00000001;
const ACE4_WRITE_DATA		= 0x00000002;
const ACE4_ADD_FILE		= 0x00000002;
const ACE4_APPEND_DATA		= 0x00000004;
const ACE4_ADD_SUBDIRECTORY	= 0x00000004;
const ACE4_READ_NAMED_ATTRS	= 0x00000008;
const ACE4_WRITE_NAMED_ATTRS	= 0x00000010;
const ACE4_EXECUTE		= 0x00000020;
const ACE4_DELETE_CHILD		= 0x00000040;
const ACE4_READ_ATTRIBUTES	= 0x00000080;
const ACE4_WRITE_ATTRIBUTES	= 0x00000100;
const ACE4_WRITE_RETENTION	= 0x00000200;
const ACE4_WRITE_RETENTION_HOLD	= 0x00000400;

const ACE4_DELETE		= 0x00010000;
const ACE4_READ_ACL		= 0x00020000;
const ACE4_WRITE_ACL		= 0x00040000;
const ACE4_WRITE_OWNER		= 0x00080000;
const ACE4_SYNCHRONIZE		= 0x00100000;
EOF
	;;

	const_mode4.x )

cat << EOF > $i
const MODE4_SUID = 0x800;  /* set user id on execution */
const MODE4_SGID = 0x400;  /* set group id on execution */
const MODE4_SVTX = 0x200;  /* save text even after use */
const MODE4_RUSR = 0x100;  /* read permission: owner */
const MODE4_WUSR = 0x080;  /* write permission: owner */
const MODE4_XUSR = 0x040;  /* execute permission: owner */
const MODE4_RGRP = 0x020;  /* read permission: group */
const MODE4_WGRP = 0x010;  /* write permission: group */
const MODE4_XGRP = 0x008;  /* execute permission: group */
const MODE4_ROTH = 0x004;  /* read permission: other */
const MODE4_WOTH = 0x002;  /* write permission: other */
const MODE4_XOTH = 0x001;  /* execute permission: other */
EOF
	;;

	const_aclflag4.x )

cat << EOF > $i
const ACL4_AUTO_INHERIT		= 0x00000001;
const ACL4_PROTECTED		= 0x00000002;
const ACL4_DEFAULTED		= 0x00000004;
EOF
	;;

	const_access_deny.x )

cat << EOF > $i
const OPEN4_SHARE_ACCESS_READ	= 0x00000001;
const OPEN4_SHARE_ACCESS_WRITE	= 0x00000002;
const OPEN4_SHARE_ACCESS_BOTH	= 0x00000003;

const OPEN4_SHARE_DENY_NONE	= 0x00000000;
const OPEN4_SHARE_DENY_READ	= 0x00000001;
const OPEN4_SHARE_DENY_WRITE	= 0x00000002;
const OPEN4_SHARE_DENY_BOTH	= 0x00000003;
EOF
	;;

	type_nfs_cb_opnum4.x )

cat << EOF > $i
%
enum nfs_cb_opnum4 {
	OP_CB_GETATTR			= 3,
	OP_CB_RECALL			= 4,
%/* Callback operations new to NFSv4.1 */
	OP_CB_LAYOUTRECALL		= 5,
	OP_CB_NOTIFY			= 6,
	OP_CB_PUSH_DELEG		= 7,
	OP_CB_RECALL_ANY		= 8,
	OP_CB_RECALLABLE_OBJ_AVAIL	= 9,
	OP_CB_RECALL_SLOT		= 10,
	OP_CB_SEQUENCE			= 11,
	OP_CB_WANTS_CANCELLED		= 12,
	OP_CB_NOTIFY_LOCK		= 13,
	OP_CB_NOTIFY_DEVICEID		= 14,
%/* Callback operations new to NFSv4.2 */
	OP_CB_COPY			= 15,
	OP_CB_LABEL_CHANGED		= 16,

	OP_CB_ILLEGAL			= 10044
};
EOF
        ;;

	type_nfs_cb_argop4.x )

cat << EOF > $i
union nfs_cb_argop4 switch (unsigned argop) {
 case OP_CB_GETATTR:
      CB_GETATTR4args           opcbgetattr;

 /* new NFSv4.1 operations */
 case OP_CB_RECALL:
      CB_RECALL4args            opcbrecall;
 case OP_CB_LAYOUTRECALL:
      CB_LAYOUTRECALL4args      opcblayoutrecall;
 case OP_CB_NOTIFY:
      CB_NOTIFY4args            opcbnotify;
 case OP_CB_PUSH_DELEG:
      CB_PUSH_DELEG4args        opcbpush_deleg;
 case OP_CB_RECALL_ANY:
      CB_RECALL_ANY4args        opcbrecall_any;
 case OP_CB_RECALLABLE_OBJ_AVAIL:
      CB_RECALLABLE_OBJ_AVAIL4args opcbrecallable_obj_avail;
 case OP_CB_RECALL_SLOT:
      CB_RECALL_SLOT4args       opcbrecall_slot;
 case OP_CB_SEQUENCE:
      CB_SEQUENCE4args          opcbsequence;
 case OP_CB_WANTS_CANCELLED:
      CB_WANTS_CANCELLED4args   opcbwants_cancelled;
 case OP_CB_NOTIFY_LOCK:
      CB_NOTIFY_LOCK4args       opcbnotify_lock;
 case OP_CB_NOTIFY_DEVICEID:
      CB_NOTIFY_DEVICEID4args   opcbnotify_deviceid;

 /* new NFSv4.2 operations */
 case OP_CB_COPY:
      CB_COPY4args   		opcbcopy;
 case OP_CB_LABEL_CHANGED:
      CB_LABEL_CHANGED4args   	opcblabelchanged;

 case OP_CB_ILLEGAL:            void;
};
EOF
        ;;

	type_CB_COMPOUND4args.x )

cat << EOF > $i
struct CB_COMPOUND4args {
	utf8str_cs	tag;
	uint32_t	minorversion;
	uint32_t	callback_ident;
	nfs_cb_argop4	argarray<>;
};
EOF
        ;;

	type_nfs_cb_resop4.x )

cat << EOF > $i
union nfs_cb_resop4 switch (unsigned resop) {
 case OP_CB_GETATTR:	CB_GETATTR4res	opcbgetattr;
 case OP_CB_RECALL:	CB_RECALL4res	opcbrecall;

 /* new NFSv4.1 operations */
 case OP_CB_LAYOUTRECALL:
			CB_LAYOUTRECALL4res
					opcblayoutrecall;

 case OP_CB_NOTIFY:	CB_NOTIFY4res	opcbnotify;

 case OP_CB_PUSH_DELEG:	CB_PUSH_DELEG4res
					opcbpush_deleg;

 case OP_CB_RECALL_ANY:	CB_RECALL_ANY4res
					opcbrecall_any;

 case OP_CB_RECALLABLE_OBJ_AVAIL:
			CB_RECALLABLE_OBJ_AVAIL4res
				opcbrecallable_obj_avail;

 case OP_CB_RECALL_SLOT:
			CB_RECALL_SLOT4res
					opcbrecall_slot;

 case OP_CB_SEQUENCE:	CB_SEQUENCE4res	opcbsequence;

 case OP_CB_WANTS_CANCELLED:
			CB_WANTS_CANCELLED4res
				opcbwants_cancelled;

 case OP_CB_NOTIFY_LOCK:
			CB_NOTIFY_LOCK4res
					opcbnotify_lock;

 case OP_CB_NOTIFY_DEVICEID:
			CB_NOTIFY_DEVICEID4res
					opcbnotify_deviceid;

 /* new NFSv4.2 operations */
 case OP_CB_COPY:	CB_COPY4res	opcbcopy;
 case OP_CB_LABEL_CHANGED:
			CB_LABEL_CHANGED4res
					oplabelchanged;

 /* Not new operation */
 case OP_CB_ILLEGAL:	CB_ILLEGAL4res	opcbillegal;
};
EOF
        ;;

	type_CB_COMPOUND4res.x )

cat << EOF > $i
struct CB_COMPOUND4res {
	nfsstat4 status;
	utf8str_cs	tag;
	nfs_cb_resop4	resarray<>;
};
EOF
        ;;

	type_nfs_opnum4.x )

cat << EOF > $i
enum nfs_opnum4 {
 OP_ACCESS		= 3,
 OP_CLOSE		= 4,
 OP_COMMIT		= 5,
 OP_CREATE		= 6,
 OP_DELEGPURGE		= 7,
 OP_DELEGRETURN		= 8,
 OP_GETATTR		= 9,
 OP_GETFH		= 10,
 OP_LINK		= 11,
 OP_LOCK		= 12,
 OP_LOCKT		= 13,
 OP_LOCKU		= 14,
 OP_LOOKUP		= 15,
 OP_LOOKUPP		= 16,
 OP_NVERIFY		= 17,
 OP_OPEN		= 18,
 OP_OPENATTR		= 19,
 OP_OPEN_CONFIRM	= 20, /* Mandatory not-to-implement */
 OP_OPEN_DOWNGRADE	= 21,
 OP_PUTFH		= 22,
 OP_PUTPUBFH		= 23,
 OP_PUTROOTFH		= 24,
 OP_READ		= 25,
 OP_READDIR		= 26,
 OP_READLINK		= 27,
 OP_REMOVE		= 28,
 OP_RENAME		= 29,
 OP_RENEW		= 30, /* Mandatory not-to-implement */
 OP_RESTOREFH		= 31,
 OP_SAVEFH		= 32,
 OP_SECINFO		= 33,
 OP_SETATTR		= 34,
 OP_SETCLIENTID		= 35, /* Mandatory not-to-implement */
 OP_SETCLIENTID_CONFIRM	= 36, /* Mandatory not-to-implement */
 OP_VERIFY		= 37,
 OP_WRITE		= 38,
 OP_RELEASE_LOCKOWNER	= 39, /* Mandatory not-to-implement */
%
%/* new operations for NFSv4.1 */
%
 OP_BACKCHANNEL_CTL	= 40,
 OP_BIND_CONN_TO_SESSION = 41,
 OP_EXCHANGE_ID		= 42,
 OP_CREATE_SESSION	= 43,
 OP_DESTROY_SESSION	= 44,
 OP_FREE_STATEID	= 45,
 OP_GET_DIR_DELEGATION	= 46,
 OP_GETDEVICEINFO	= 47,
 OP_GETDEVICELIST	= 48,
 OP_LAYOUTCOMMIT	= 49,
 OP_LAYOUTGET		= 50,
 OP_LAYOUTRETURN	= 51,
 OP_SECINFO_NO_NAME	= 52,
 OP_SEQUENCE		= 53,
 OP_SET_SSV		= 54,
 OP_TEST_STATEID	= 55,
 OP_WANT_DELEGATION	= 56,
 OP_DESTROY_CLIENTID	= 57,
 OP_RECLAIM_COMPLETE	= 58,
%
%/* new operations for NFSv4.2 */
%
 OP_COPY		= 59,
 OP_COPY_ABORT		= 60,
 OP_COPY_NOTIFY		= 61,
 OP_COPY_REVOKE		= 62,
 OP_COPY_STATUS		= 63,
 OP_INITIALIZE		= 64,
 OP_READ_PLUS		= 65,
 OP_ILLEGAL		= 10044
};
EOF
        ;;

	type_nfs_argop4.x )

cat << EOF > $i
union nfs_argop4 switch (nfs_opnum4 argop) {
 case OP_ACCESS:	ACCESS4args opaccess;
 case OP_CLOSE:		CLOSE4args opclose;
 case OP_COMMIT:	COMMIT4args opcommit;
 case OP_CREATE:	CREATE4args opcreate;
 case OP_DELEGPURGE:	DELEGPURGE4args opdelegpurge;
 case OP_DELEGRETURN:	DELEGRETURN4args opdelegreturn;
 case OP_GETATTR:	GETATTR4args opgetattr;
 case OP_GETFH:		void;
 case OP_LINK:		LINK4args oplink;
 case OP_LOCK:		LOCK4args oplock;
 case OP_LOCKT:		LOCKT4args oplockt;
 case OP_LOCKU:		LOCKU4args oplocku;
 case OP_LOOKUP:	LOOKUP4args oplookup;
 case OP_LOOKUPP:	void;
 case OP_NVERIFY:	NVERIFY4args opnverify;
 case OP_OPEN:		OPEN4args opopen;
 case OP_OPENATTR:	OPENATTR4args opopenattr;

 /* Not for NFSv4.1 */
 case OP_OPEN_CONFIRM:	OPEN_CONFIRM4args opopen_confirm;

 case OP_OPEN_DOWNGRADE:
			OPEN_DOWNGRADE4args opopen_downgrade;

 case OP_PUTFH:		PUTFH4args opputfh;
 case OP_PUTPUBFH:	void;
 case OP_PUTROOTFH:	void;
 case OP_READ:		READ4args opread;
 case OP_READDIR:	READDIR4args opreaddir;
 case OP_READLINK:	void;
 case OP_REMOVE:	REMOVE4args opremove;
 case OP_RENAME:	RENAME4args oprename;

 /* Not for NFSv4.1 */
 case OP_RENEW:		RENEW4args oprenew;

 case OP_RESTOREFH:	void;
 case OP_SAVEFH:	void;
 case OP_SECINFO:	SECINFO4args opsecinfo;
 case OP_SETATTR:	SETATTR4args opsetattr;

 /* Not for NFSv4.1 */
 case OP_SETCLIENTID: SETCLIENTID4args opsetclientid;

 /* Not for NFSv4.1 */
 case OP_SETCLIENTID_CONFIRM: SETCLIENTID_CONFIRM4args
				opsetclientid_confirm;
 case OP_VERIFY:	VERIFY4args opverify;
 case OP_WRITE:		WRITE4args opwrite;

 /* Not for NFSv4.1 */
 case OP_RELEASE_LOCKOWNER:
			RELEASE_LOCKOWNER4args
			oprelease_lockowner;

 /* Operations new to NFSv4.1 */
 case OP_BACKCHANNEL_CTL:
			BACKCHANNEL_CTL4args opbackchannel_ctl;

 case OP_BIND_CONN_TO_SESSION:
			BIND_CONN_TO_SESSION4args
			opbind_conn_to_session;

 case OP_EXCHANGE_ID:	EXCHANGE_ID4args opexchange_id;

 case OP_CREATE_SESSION:
			CREATE_SESSION4args opcreate_session;

 case OP_DESTROY_SESSION:
			DESTROY_SESSION4args opdestroy_session;

 case OP_FREE_STATEID:	FREE_STATEID4args opfree_stateid;

 case OP_GET_DIR_DELEGATION:
			GET_DIR_DELEGATION4args
				opget_dir_delegation;

 case OP_GETDEVICEINFO:	GETDEVICEINFO4args opgetdeviceinfo;
 case OP_GETDEVICELIST:	GETDEVICELIST4args opgetdevicelist;
 case OP_LAYOUTCOMMIT:	LAYOUTCOMMIT4args oplayoutcommit;
 case OP_LAYOUTGET:	LAYOUTGET4args oplayoutget;
 case OP_LAYOUTRETURN:	LAYOUTRETURN4args oplayoutreturn;

 case OP_SECINFO_NO_NAME:
			SECINFO_NO_NAME4args opsecinfo_no_name;

 case OP_SEQUENCE:	SEQUENCE4args opsequence;
 case OP_SET_SSV:	SET_SSV4args opset_ssv;
 case OP_TEST_STATEID:	TEST_STATEID4args optest_stateid;

 case OP_WANT_DELEGATION:
			WANT_DELEGATION4args opwant_delegation;

 case OP_DESTROY_CLIENTID:
			DESTROY_CLIENTID4args
				opdestroy_clientid;

 case OP_RECLAIM_COMPLETE:
			RECLAIM_COMPLETE4args
				opreclaim_complete;

 /* Operations new to NFSv4.2 */
 case OP_COPY_NOTIFY:	COPY_NOTIFY4args opcopy_notify;
 case OP_COPY_REVOKE:	COPY_REVOKE4args opcopy_revoke;
 case OP_COPY:		COPY4args opcopy;
 case OP_COPY_ABORT:	COPY_ABORT4args opcopy_abort;
 case OP_COPY_STATUS:	COPY_STATUS4args opcopy_status;
 case OP_INITIALIZE:	INITIALIZE4args opinitialize;
 case OP_READ_PLUS:	READ_PLUS4args opread_plus;

 /* Operations not new to NFSv4.1 */
 case OP_ILLEGAL:	void;
};
EOF
        ;;

	type_nfs_resop4.x )

cat << EOF > $i
union nfs_resop4 switch (nfs_opnum4 resop) {
 case OP_ACCESS:	ACCESS4res opaccess;
 case OP_CLOSE:		CLOSE4res opclose;
 case OP_COMMIT:	COMMIT4res opcommit;
 case OP_CREATE:	CREATE4res opcreate;
 case OP_DELEGPURGE:	DELEGPURGE4res opdelegpurge;
 case OP_DELEGRETURN:	DELEGRETURN4res opdelegreturn;
 case OP_GETATTR:	GETATTR4res opgetattr;
 case OP_GETFH:		GETFH4res opgetfh;
 case OP_LINK:		LINK4res oplink;
 case OP_LOCK:		LOCK4res oplock;
 case OP_LOCKT:		LOCKT4res oplockt;
 case OP_LOCKU:		LOCKU4res oplocku;
 case OP_LOOKUP:	LOOKUP4res oplookup;
 case OP_LOOKUPP:	LOOKUPP4res oplookupp;
 case OP_NVERIFY:	NVERIFY4res opnverify;
 case OP_OPEN:		OPEN4res opopen;
 case OP_OPENATTR:	OPENATTR4res opopenattr;
 /* Not for NFSv4.1 */
 case OP_OPEN_CONFIRM:	OPEN_CONFIRM4res opopen_confirm;

 case OP_OPEN_DOWNGRADE:
			OPEN_DOWNGRADE4res
				opopen_downgrade;

 case OP_PUTFH:		PUTFH4res opputfh;
 case OP_PUTPUBFH:	PUTPUBFH4res opputpubfh;
 case OP_PUTROOTFH:	PUTROOTFH4res opputrootfh;
 case OP_READ:		READ4res opread;
 case OP_READDIR:	READDIR4res opreaddir;
 case OP_READLINK:	READLINK4res opreadlink;
 case OP_REMOVE:	REMOVE4res opremove;
 case OP_RENAME:	RENAME4res oprename;
 /* Not for NFSv4.1 */
 case OP_RENEW:		RENEW4res oprenew;
 case OP_RESTOREFH:	RESTOREFH4res oprestorefh;
 case OP_SAVEFH:	SAVEFH4res opsavefh;
 case OP_SECINFO:	SECINFO4res opsecinfo;
 case OP_SETATTR:	SETATTR4res opsetattr;
 /* Not for NFSv4.1 */
 case OP_SETCLIENTID: SETCLIENTID4res opsetclientid;

 /* Not for NFSv4.1 */
 case OP_SETCLIENTID_CONFIRM:
			SETCLIENTID_CONFIRM4res
				opsetclientid_confirm;
 case OP_VERIFY:	VERIFY4res opverify;
 case OP_WRITE:		WRITE4res opwrite;

 /* Not for NFSv4.1 */
 case OP_RELEASE_LOCKOWNER:
			RELEASE_LOCKOWNER4res
				oprelease_lockowner;

 /* Operations new to NFSv4.1 */
 case OP_BACKCHANNEL_CTL:
			BACKCHANNEL_CTL4res
				opbackchannel_ctl;

 case OP_BIND_CONN_TO_SESSION:
			BIND_CONN_TO_SESSION4res
				 opbind_conn_to_session;

 case OP_EXCHANGE_ID:	EXCHANGE_ID4res opexchange_id;

 case OP_CREATE_SESSION:
			CREATE_SESSION4res
				opcreate_session;

 case OP_DESTROY_SESSION:
			DESTROY_SESSION4res
				opdestroy_session;

 case OP_FREE_STATEID:	FREE_STATEID4res
				opfree_stateid;

 case OP_GET_DIR_DELEGATION:
			GET_DIR_DELEGATION4res
				opget_dir_delegation;

 case OP_GETDEVICEINFO:	GETDEVICEINFO4res
				opgetdeviceinfo;

 case OP_GETDEVICELIST:	GETDEVICELIST4res
				opgetdevicelist;

 case OP_LAYOUTCOMMIT:	LAYOUTCOMMIT4res oplayoutcommit;
 case OP_LAYOUTGET:	LAYOUTGET4res oplayoutget;
 case OP_LAYOUTRETURN:	LAYOUTRETURN4res oplayoutreturn;

 case OP_SECINFO_NO_NAME:
			SECINFO_NO_NAME4res
				opsecinfo_no_name;

 case OP_SEQUENCE:	SEQUENCE4res opsequence;
 case OP_SET_SSV:	SET_SSV4res opset_ssv;
 case OP_TEST_STATEID:	TEST_STATEID4res optest_stateid;

 case OP_WANT_DELEGATION:
			WANT_DELEGATION4res
				opwant_delegation;

 case OP_DESTROY_CLIENTID:
			DESTROY_CLIENTID4res
				opdestroy_clientid;

 case OP_RECLAIM_COMPLETE:
			RECLAIM_COMPLETE4res
				opreclaim_complete;

 /* Operations new to NFSv4.2 */
 case OP_COPY_NOTIFY:	COPY_NOTIFY4res opcopy_notify;
 case OP_COPY_REVOKE:	COPY_REVOKE4res opcopy_revoke;
 case OP_COPY:		COPY4res opcopy;
 case OP_COPY_ABORT:	COPY_ABORT4res opcopy_abort;
 case OP_COPY_STATUS:	COPY_STATUS4res opcopy_status;
 case OP_INITIALIZE:	INITIALIZE4res opinitialize;
 case OP_READ_PLUS:	READ_PLUS4res opread_plus;

 /* Operations not new to NFSv4.1 */
 case OP_ILLEGAL:	ILLEGAL4res opillegal;
};
EOF
        ;;

	type_COMPOUND4args.x )

cat << EOF > $i
struct COMPOUND4args {
	utf8str_cs	tag;
	uint32_t	minorversion;
	nfs_argop4	argarray<>;
};
EOF
	;;

	type_COMPOUND4res.x )

cat << EOF > $i
struct COMPOUND4res {
	nfsstat4	status;
	utf8str_cs	tag;
	nfs_resop4	resarray<>;
};
EOF
	;;

	type_netloc_type4.x )

cat << EOF > $i
enum netloc_type4 {
	NL4_NAME	= 0,
	NL4_URL		= 1,
	NL4_NETADDR	= 2
};
union netloc4 switch (netloc_type4 nl_type) {
	case NL4_NAME:		utf8str_cis nl_name;
	case NL4_URL:		utf8str_cis nl_url;
	case NL4_NETADDR:	netaddr4    nl_addr;
};
EOF
	;;

	type_nfsacl41.x )

cat << EOF > $i
struct nfsacl41 {
	aclflag4	na41_flag;
	nfsace4		na41_aces<>;
};
EOF
	;;

	type_chattr_type.x )

cat << EOF > $i
enum change_attr_typeinfo {
           NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR         = 0,
           NFS4_CHANGE_TYPE_IS_VERSION_COUNTER        = 1,
           NFS4_CHANGE_TYPE_IS_VERSION_COUNTER_NOPNFS = 2,
           NFS4_CHANGE_TYPE_IS_TIME_METADATA          = 3,
           NFS4_CHANGE_TYPE_IS_UNDEFINED              = 4
};
EOF
	;;

	copy_from_auth.x )

cat << EOF > $i
struct copy_from_auth_priv {
	secret4             cfap_shared_secret;
	netloc4             cfap_destination;
	/* the NFSv4 user name that the user principal maps to */
	utf8str_mixed       cfap_username;
	/* equal to seq_num of rpc_gss_cred_vers_3_t */
	unsigned int        cfap_seq_num;
};
EOF
	;;

	copy_to_auth.x )

cat << EOF > $i
struct copy_to_auth_priv {
	/* equal to cfap_shared_secret */
	secret4              ctap_shared_secret;
	netloc4              ctap_source;
	/* the NFSv4 user name that the user principal maps to */
	utf8str_mixed        ctap_username;
	/* equal to seq_num of rpc_gss_cred_vers_3_t */
	unsigned int         ctap_seq_num;
};
EOF
	;;

	copy_confirm_auth.x )

cat << EOF > $i
struct copy_confirm_auth_priv {
	/* equal to GSS_GetMIC() of cfap_shared_secret */
	opaque              ccap_shared_secret_mic<>;
	/* the NFSv4 user name that the user principal maps to */
	utf8str_mixed       ccap_username;
	/* equal to seq_num of rpc_gss_cred_vers_3_t */
	unsigned int        ccap_seq_num;
};
EOF

	;;

	app_data_block4.x )

cat << EOF > $i
struct app_data_block4 {
	offset4		adb_offset;
	length4		adb_block_size;
	length4		adb_block_count;
	length4		adb_reloff_blocknum;
	count4		adb_block_num;
	length4		adb_reloff_pattern;
	opaque		adb_pattern<>;
};
EOF

	;;

	hole_info4.x )

cat << EOF > $i
struct hole_info4 {
	offset4		hi_offset;
	length4		hi_length;
};
EOF

	;;

	data_content4.x )

cat << EOF > $i
/*
 * Use an enum such that we can extend new types.
 */
enum data_content4 {
	NFS4_CONTENT_DATA = 0,
	NFS4_CONTENT_APP_BLOCK = 1,
	NFS4_CONTENT_HOLE = 2
};
EOF

	;;

	type_label_format.x )

cat << EOF > $i
struct labelformat_spec4 {
	policy4	lfs_lfs;
	policy4	lfs_pi;
};

struct sec_label_attr_info {
	labelformat_spec4	slai_lfs;
	opaque			slai_data<>;
};
EOF

	;;

	* )
		echo $0: Error: $i not recognized target.

		exit 1
	;;

	esac

done

rm -f $tmp

exit 0
