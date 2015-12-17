/*
 *  Copyright (C) The IETF Trust (2007-2014)
 *  All Rights Reserved.
 *
 *  Copyright (C) The Internet Society (1998-2006).
 *  All Rights Reserved.
 */

/*
 *	nfsv42.x
 */

%#ifndef _AUTH_SYS_DEFINE_FOR_NFSv42
%#define _AUTH_SYS_DEFINE_FOR_NFSv42
%#include <rpc/auth_sys.h>
%typedef struct authsys_parms authsys_parms;
%#endif /* _AUTH_SYS_DEFINE_FOR_NFSv42 */

/*
 * Basic typedefs for RFC 1832 data type definitions
 */

/*
 * typedef int			int32_t;
 * typedef unsigned int		uint32_t;
 * typedef hyper		int64_t;
 * typedef unsigned hyper	uint64_t;
 */

/*
 * Sizes
 */
include(const_sizes.x)

/*
 * File types
 */
enum nfs_ftype4 {
	NF4REG	= 1,	/* Regular File */
	NF4DIR	= 2,	/* Directory */
	NF4BLK	= 3,	/* Special File - block device */
	NF4CHR	= 4,	/* Special File - character device */
	NF4LNK	= 5,	/* Symbolic Link */
	NF4SOCK	= 6,	/* Special File - socket */
	NF4FIFO	= 7,	/* Special File - fifo */
	NF4ATTRDIR
		= 8,	/* Attribute Directory */
	NF4NAMEDATTR
		= 9	/* Named Attribute */
};

/*
 * Error status
 */
enum nfsstat4 {
 NFS4_OK		= 0,	/* everything is okay	   */
 NFS4ERR_PERM		= 1,	/* caller not privileged   */
 NFS4ERR_NOENT		= 2,	/* no such file/directory  */
 NFS4ERR_IO		= 5,	/* hard I/O error	   */
 NFS4ERR_NXIO		= 6,	/* no such device	   */
 NFS4ERR_ACCESS		= 13,	/* access denied	   */
 NFS4ERR_EXIST		= 17,	/* file already exists	   */
 NFS4ERR_XDEV		= 18,	/* different filesystems   */

/*
 * Please do not allocate value 19; it was used in NFSv3
 * and we do not want a value in NFSv3 to have a different
 * meaning in NFSv4.x.
 */

 NFS4ERR_NOTDIR		= 20,	/* should be a directory   */
 NFS4ERR_ISDIR		= 21,	/* should not be directory */
 NFS4ERR_INVAL		= 22,	/* invalid argument	   */
 NFS4ERR_FBIG		= 27,	/* file exceeds server max */
 NFS4ERR_NOSPC		= 28,	/* no space on filesystem  */
 NFS4ERR_ROFS		= 30,	/* read-only filesystem	   */
 NFS4ERR_MLINK		= 31,	/* too many hard links	   */
 NFS4ERR_NAMETOOLONG	= 63,	/* name exceeds server max */
 NFS4ERR_NOTEMPTY	= 66,	/* directory not empty	   */
 NFS4ERR_DQUOT		= 69,	/* hard quota limit reached*/
 NFS4ERR_STALE		= 70,	/* file no longer exists   */
 NFS4ERR_BADHANDLE	= 10001,/* Illegal filehandle	   */
 NFS4ERR_BAD_COOKIE	= 10003,/* READDIR cookie is stale */
 NFS4ERR_NOTSUPP	= 10004,/* operation not supported */
 NFS4ERR_TOOSMALL	= 10005,/* response limit exceeded */
 NFS4ERR_SERVERFAULT	= 10006,/* undefined server error  */
 NFS4ERR_BADTYPE	= 10007,/* type invalid for CREATE */
 NFS4ERR_DELAY		= 10008,/* file "busy" - retry	   */
 NFS4ERR_SAME		= 10009,/* nverify says attrs same */
 NFS4ERR_DENIED		= 10010,/* lock unavailable	   */
 NFS4ERR_EXPIRED	= 10011,/* lock lease expired	   */
 NFS4ERR_LOCKED		= 10012,/* I/O failed due to lock  */
 NFS4ERR_GRACE		= 10013,/* in grace period	   */
 NFS4ERR_FHEXPIRED	= 10014,/* filehandle expired	   */
 NFS4ERR_SHARE_DENIED	= 10015,/* share reserve denied	   */
 NFS4ERR_WRONGSEC	= 10016,/* wrong security flavor   */
 NFS4ERR_CLID_INUSE	= 10017,/* clientid in use	   */

 /* NFS4ERR_RESOURCE is not a valid error in NFSv4.1 */
 NFS4ERR_RESOURCE	= 10018,/* resource exhaustion	   */

 NFS4ERR_MOVED		= 10019,/* filesystem relocated	   */
 NFS4ERR_NOFILEHANDLE	= 10020,/* current FH is not set   */
 NFS4ERR_MINOR_VERS_MISMATCH= 10021,/* minor vers not supp */
 NFS4ERR_STALE_CLIENTID	= 10022,/* server has rebooted	   */
 NFS4ERR_STALE_STATEID	= 10023,/* server has rebooted	   */
 NFS4ERR_OLD_STATEID	= 10024,/* state is out of sync	   */
 NFS4ERR_BAD_STATEID	= 10025,/* incorrect stateid	   */
 NFS4ERR_BAD_SEQID	= 10026,/* request is out of seq.  */
 NFS4ERR_NOT_SAME	= 10027,/* verify - attrs not same */
 NFS4ERR_LOCK_RANGE	= 10028,/* overlapping lock range  */
 NFS4ERR_SYMLINK	= 10029,/* should be file/directory*/
 NFS4ERR_RESTOREFH	= 10030,/* no saved filehandle	   */
 NFS4ERR_LEASE_MOVED	= 10031,/* some filesystem moved   */
 NFS4ERR_ATTRNOTSUPP	= 10032,/* recommended attr not sup*/
 NFS4ERR_NO_GRACE	= 10033,/* reclaim outside of grace*/
 NFS4ERR_RECLAIM_BAD	= 10034,/* reclaim error at server */
 NFS4ERR_RECLAIM_CONFLICT= 10035,/* conflict on reclaim	   */
 NFS4ERR_BADXDR		= 10036,/* XDR decode failed	   */
 NFS4ERR_LOCKS_HELD	= 10037,/* file locks held at CLOSE*/
 NFS4ERR_OPENMODE	= 10038,/* conflict in OPEN and I/O*/
 NFS4ERR_BADOWNER	= 10039,/* owner translation bad   */
 NFS4ERR_BADCHAR	= 10040,/* utf-8 char not supported*/
 NFS4ERR_BADNAME	= 10041,/* name not supported	   */
 NFS4ERR_BAD_RANGE	= 10042,/* lock range not supported*/
 NFS4ERR_LOCK_NOTSUPP	= 10043,/* no atomic up/downgrade  */
 NFS4ERR_OP_ILLEGAL	= 10044,/* undefined operation	   */
 NFS4ERR_DEADLOCK	= 10045,/* file locking deadlock   */
 NFS4ERR_FILE_OPEN	= 10046,/* open file blocks op.	   */
 NFS4ERR_ADMIN_REVOKED	= 10047,/* lockowner state revoked */
 NFS4ERR_CB_PATH_DOWN	= 10048,/* callback path down	   */

 /* NFSv4.1 errors start here. */

 NFS4ERR_BADIOMODE	= 10049,
 NFS4ERR_BADLAYOUT	= 10050,
 NFS4ERR_BAD_SESSION_DIGEST = 10051,
 NFS4ERR_BADSESSION	= 10052,
 NFS4ERR_BADSLOT	= 10053,
 NFS4ERR_COMPLETE_ALREADY = 10054,
 NFS4ERR_CONN_NOT_BOUND_TO_SESSION = 10055,
 NFS4ERR_DELEG_ALREADY_WANTED = 10056,
 NFS4ERR_BACK_CHAN_BUSY	= 10057,/*backchan reqs outstanding*/
 NFS4ERR_LAYOUTTRYLATER	= 10058,
 NFS4ERR_LAYOUTUNAVAILABLE = 10059,
 NFS4ERR_NOMATCHING_LAYOUT = 10060,
 NFS4ERR_RECALLCONFLICT	= 10061,
 NFS4ERR_UNKNOWN_LAYOUTTYPE = 10062,
 NFS4ERR_SEQ_MISORDERED = 10063,/* unexpected seq.ID in req*/
 NFS4ERR_SEQUENCE_POS	= 10064,/* [CB_]SEQ. op not 1st op */
 NFS4ERR_REQ_TOO_BIG	= 10065,/* request too big         */
 NFS4ERR_REP_TOO_BIG	= 10066,/* reply too big           */
 NFS4ERR_REP_TOO_BIG_TO_CACHE =10067,/* rep. not all cached*/
 NFS4ERR_RETRY_UNCACHED_REP =10068,/* retry + rep. uncached*/
 NFS4ERR_UNSAFE_COMPOUND =10069,/* retry/recovery too hard */
 NFS4ERR_TOO_MANY_OPS	= 10070,/*too many ops in [CB_]COMP*/
 NFS4ERR_OP_NOT_IN_SESSION =10071,/* op needs [CB_]SEQ. op */
 NFS4ERR_HASH_ALG_UNSUPP = 10072, /* hash alg. not supp.   */
                                /* Error 10073 is unused.  */
 NFS4ERR_CLIENTID_BUSY	= 10074,/* clientid has state	   */
 NFS4ERR_PNFS_IO_HOLE	= 10075,/* IO to _SPARSE file hole */
 NFS4ERR_SEQ_FALSE_RETRY= 10076,/* Retry != original req.  */
 NFS4ERR_BAD_HIGH_SLOT	= 10077,/* req has bad highest_slot*/
 NFS4ERR_DEADSESSION  	= 10078,/*new req sent to dead sess*/
 NFS4ERR_ENCR_ALG_UNSUPP= 10079,/* encr alg. not supp.     */
 NFS4ERR_PNFS_NO_LAYOUT = 10080,/* I/O without a layout    */
 NFS4ERR_NOT_ONLY_OP    = 10081,/* addl ops not allowed    */
 NFS4ERR_WRONG_CRED     = 10082,/* op done by wrong cred   */
 NFS4ERR_WRONG_TYPE     = 10083,/* op on wrong type object */
 NFS4ERR_DIRDELEG_UNAVAIL=10084,/* delegation not avail.   */
 NFS4ERR_REJECT_DELEG   = 10085,/* cb rejected delegation  */
 NFS4ERR_RETURNCONFLICT = 10086,/* layout get before return*/
 NFS4ERR_DELEG_REVOKED  = 10087,/* deleg./layout revoked   */

 /* NFSv4.2 errors start here. */

 NFS4ERR_PARTNER_NOTSUPP= 10088,/* s2s not supported       */
 NFS4ERR_PARTNER_NO_AUTH= 10089,/* s2s not authorized      */
 NFS4ERR_UNION_NOTSUPP  = 10090,/* Arm of union not supp   */
 NFS4ERR_OFFLOAD_DENIED = 10091,/* dest not allowing copy  */
 NFS4ERR_WRONG_LFS      = 10092,/* LFS not supported       */
 NFS4ERR_BADLABEL       = 10093,/* incorrect label         */
 NFS4ERR_OFFLOAD_NO_REQS= 10094 /* dest not meeting reqs   */
};

/*
 * Basic data types
 */
include(basic_types.x)
/*
 * Timeval
 */
include(type_nfstime4.x)
include(type_time_how4.x)
include(type_settime4.x)

typedef uint32_t nfs_lease4;

/*
 * File attribute definitions
 */

/*
 * FSID structure for major/minor
 */
include(type_fsid4.x)
/*
 * Filesystem locations attribute
 * for relocation/migration and
 * related attributes.
 */
include(type_chg_policy4.x)
include(type_fs_location4.x)
include(type_fs_locations4.x)
/*
 * Various Access Control Entry definitions
 */

/*
 * Mask that indicates which
 * Access Control Entries are supported.
 * Values for the fattr4_aclsupport attribute.
 */
include(const_aclsupport4.x)

include(type_acetype4.x)

/*
 * acetype4 values, others can be added as needed.
 */
include(const_acetype4.x)


/*
 * ACE flag
 */
include(type_aceflag4.x)

/*
 * ACE flag values
 */
include(const_aceflag4.x)


/*
 * ACE mask
 */
include(type_acemask4.x)

/*
 * ACE mask values
 */
include(const_acemask4.x)

/*
 * ACE4_GENERIC_READ -- defined as combination of
 *	ACE4_READ_ACL |
 *	ACE4_READ_DATA |
 *	ACE4_READ_ATTRIBUTES |
 *	ACE4_SYNCHRONIZE
 */

const ACE4_GENERIC_READ = 0x00120081;

/*
 * ACE4_GENERIC_WRITE -- defined as combination of
 *	ACE4_READ_ACL |
 *	ACE4_WRITE_DATA |
 *	ACE4_WRITE_ATTRIBUTES |
 *	ACE4_WRITE_ACL |
 *	ACE4_APPEND_DATA |
 *	ACE4_SYNCHRONIZE
 */
const ACE4_GENERIC_WRITE = 0x00160106;


/*
 * ACE4_GENERIC_EXECUTE -- defined as combination of
 *	ACE4_READ_ACL
 *	ACE4_READ_ATTRIBUTES
 *	ACE4_EXECUTE
 *	ACE4_SYNCHRONIZE
 */
const ACE4_GENERIC_EXECUTE = 0x001200A0;


/*
 * Access Control Entry definition
 */
include(type_nfsace4.x)

/*
 * ACL flag
 */

typedef uint32_t aclflag4;

/*
 * ACL flag values
 */
include(const_aclflag4.x)

/*
 * Version 4.1 Access Control List definition
 */
include(type_nfsacl41.x)

/*
 * Field definitions for the fattr4_mode
 * and fattr4_mode_set_masked attributes.
 */
include(const_mode4.x)

/*
 * Masked mode for the mode_set_masked attribute.
 */
struct mode_masked4 {
 mode4	mm_value_to_set; /* Values of bits
                            to set or reset
                            in mode. */

 mode4	mm_mask_bits;    /* Mask of bits to
                            set or reset
                            in mode. */
};

/*
 * Special data/attribute associated with
 * file types NF4BLK and NF4CHR.
 */
include(type_specdata4.x)
/*
 * Values for fattr4_fh_expire_type
 */
const	FH4_PERSISTENT		= 0x00000000;
const	FH4_NOEXPIRE_WITH_OPEN	= 0x00000001;
const	FH4_VOLATILE_ANY	= 0x00000002;
const	FH4_VOL_MIGRATION	= 0x00000004;
const	FH4_VOL_RENAME		= 0x00000008;


include(type_netaddr4.x)

/*
 * data structures new to NFSv4.1
 */

include(type_nfs_impl_id4.x)

/*
 * Stateid
 */
include(type_stateid4.x)
include(type_layouttype4.x)
include(type_layout_content4.x)

%/*
% * LAYOUT4_OSD2_OBJECTS loc_body description
% * is in a separate .x file
% */
%
%/*
% * LAYOUT4_BLOCK_VOLUME loc_body description
% * is in a separate .x file
% */

include(type_layouthint4.x)
include(type_layoutiomode4.x)
include(type_layout4.x)
include(type_deviceid4.x)
include(type_device_addr4.x)

include(type_layoutupdate4.x)
include(type_layoutreturn4.x)
include(type_fs4_status.x)

const TH4_READ_SIZE	= 0;
const TH4_WRITE_SIZE	= 1;
const TH4_READ_IOSIZE	= 2;
const TH4_WRITE_IOSIZE	= 3;

typedef length4 threshold4_read_size;
typedef length4 threshold4_write_size;
typedef length4 threshold4_read_iosize;
typedef length4 threshold4_write_iosize;

include(type_threshold_item4.x)
include(type_mdsthreshold4.x)
include(type_retention_get4.x)
include(type_retention_set4.x)
include(type_fs_charset_cap4.x)

/*
 * data structures new to NFSv4.2
 */

include(type_netloc_type4.x)
include(type_chattr_type.x)
include(type_label_format.x)

include(copy_from_auth.x)
include(copy_to_auth.x)
include(copy_confirm_auth.x)

include(app_data_block4.x)

include(data4.x)
include(data_info4.x)

include(data_content4.x)

include(stable_how4.x)

include(write_response4.x)

/*
 * NFSv4.1 attributes
 */
typedef bitmap4		fattr4_supported_attrs;
typedef nfs_ftype4	fattr4_type;
typedef uint32_t	fattr4_fh_expire_type;
typedef changeid4	fattr4_change;
typedef uint64_t	fattr4_size;
typedef bool		fattr4_link_support;
typedef bool		fattr4_symlink_support;
typedef bool		fattr4_named_attr;
typedef fsid4		fattr4_fsid;
typedef bool		fattr4_unique_handles;
typedef nfs_lease4	fattr4_lease_time;
typedef nfsstat4	fattr4_rdattr_error;
typedef nfsace4		fattr4_acl<>;
typedef uint32_t	fattr4_aclsupport;
typedef bool		fattr4_archive;
typedef bool		fattr4_cansettime;
typedef bool		fattr4_case_insensitive;
typedef bool		fattr4_case_preserving;
typedef bool		fattr4_chown_restricted;
typedef uint64_t	fattr4_fileid;
typedef uint64_t	fattr4_files_avail;
typedef nfs_fh4		fattr4_filehandle;
typedef uint64_t	fattr4_files_free;
typedef uint64_t	fattr4_files_total;
typedef fs_locations4	fattr4_fs_locations;
typedef bool		fattr4_hidden;
typedef bool		fattr4_homogeneous;
typedef uint64_t	fattr4_maxfilesize;
typedef uint32_t	fattr4_maxlink;
typedef uint32_t	fattr4_maxname;
typedef uint64_t	fattr4_maxread;
typedef uint64_t	fattr4_maxwrite;
typedef ascii_REQUIRED4	fattr4_mimetype;
typedef mode4		fattr4_mode;
typedef mode_masked4	fattr4_mode_set_masked;
typedef uint64_t	fattr4_mounted_on_fileid;
typedef bool		fattr4_no_trunc;
typedef uint32_t	fattr4_numlinks;
typedef utf8str_mixed	fattr4_owner;
typedef utf8str_mixed	fattr4_owner_group;
typedef uint64_t	fattr4_quota_avail_hard;
typedef uint64_t	fattr4_quota_avail_soft;
typedef uint64_t	fattr4_quota_used;
typedef specdata4	fattr4_rawdev;
typedef uint64_t	fattr4_space_avail;
typedef length4		fattr4_space_free;
typedef uint64_t	fattr4_space_total;
typedef uint64_t	fattr4_space_used;
typedef bool		fattr4_system;
typedef nfstime4	fattr4_time_access;
typedef settime4	fattr4_time_access_set;
typedef nfstime4	fattr4_time_backup;
typedef nfstime4	fattr4_time_create;
typedef nfstime4	fattr4_time_delta;
typedef nfstime4	fattr4_time_metadata;
typedef nfstime4	fattr4_time_modify;
typedef settime4	fattr4_time_modify_set;
/*
 * attributes new to NFSv4.1
 */
typedef bitmap4		fattr4_suppattr_exclcreat;
typedef nfstime4	fattr4_dir_notif_delay;
typedef nfstime4	fattr4_dirent_notif_delay;
typedef layouttype4	fattr4_fs_layout_types<>;
typedef fs4_status	fattr4_fs_status;
typedef fs_charset_cap4	fattr4_fs_charset_cap;
typedef uint32_t	fattr4_layout_alignment;
typedef uint32_t	fattr4_layout_blksize;
typedef layouthint4	fattr4_layout_hint;
typedef layouttype4	fattr4_layout_types<>;
typedef mdsthreshold4	fattr4_mdsthreshold;
typedef retention_get4	fattr4_retention_get;
typedef retention_set4	fattr4_retention_set;
typedef retention_get4	fattr4_retentevt_get;
typedef retention_set4	fattr4_retentevt_set;
typedef uint64_t	fattr4_retention_hold;
typedef nfsacl41	fattr4_dacl;
typedef nfsacl41	fattr4_sacl;
typedef change_policy4	fattr4_change_policy;
/*
 * attributes new to NFSv4.2
 */
typedef uint64_t	fattr4_space_freed;
typedef change_attr_type4
		fattr4_change_attr_type;
typedef sec_label4	fattr4_sec_label;
typedef uint32_t	fattr4_clone_blksize;

%/*
% * REQUIRED Attributes
% */
const FATTR4_SUPPORTED_ATTRS	= 0;
const FATTR4_TYPE		= 1;
const FATTR4_FH_EXPIRE_TYPE	= 2;
const FATTR4_CHANGE		= 3;
const FATTR4_SIZE		= 4;
const FATTR4_LINK_SUPPORT	= 5;
const FATTR4_SYMLINK_SUPPORT	= 6;
const FATTR4_NAMED_ATTR		= 7;
const FATTR4_FSID		= 8;
const FATTR4_UNIQUE_HANDLES	= 9;
const FATTR4_LEASE_TIME		= 10;
const FATTR4_RDATTR_ERROR	= 11;
const FATTR4_FILEHANDLE		= 19;

%/*
% * new to NFSV4.1
% */
const FATTR4_SUPPATTR_EXCLCREAT = 75;

%/*
% * RECOMMENDED Attributes
% */
const FATTR4_ACL		= 12;
const FATTR4_ACLSUPPORT		= 13;
const FATTR4_ARCHIVE		= 14;
const FATTR4_CANSETTIME		= 15;
const FATTR4_CASE_INSENSITIVE	= 16;
const FATTR4_CASE_PRESERVING	= 17;
const FATTR4_CHOWN_RESTRICTED	= 18;
const FATTR4_FILEID		= 20;
const FATTR4_FILES_AVAIL	= 21;
const FATTR4_FILES_FREE		= 22;
const FATTR4_FILES_TOTAL	= 23;
const FATTR4_FS_LOCATIONS	= 24;
const FATTR4_HIDDEN		= 25;
const FATTR4_HOMOGENEOUS	= 26;
const FATTR4_MAXFILESIZE	= 27;
const FATTR4_MAXLINK		= 28;
const FATTR4_MAXNAME		= 29;
const FATTR4_MAXREAD		= 30;
const FATTR4_MAXWRITE		= 31;
const FATTR4_MIMETYPE		= 32;
const FATTR4_MODE		= 33;
const FATTR4_NO_TRUNC		= 34;
const FATTR4_NUMLINKS		= 35;
const FATTR4_OWNER		= 36;
const FATTR4_OWNER_GROUP	= 37;
const FATTR4_QUOTA_AVAIL_HARD	= 38;
const FATTR4_QUOTA_AVAIL_SOFT	= 39;
const FATTR4_QUOTA_USED		= 40;
const FATTR4_RAWDEV		= 41;
const FATTR4_SPACE_AVAIL	= 42;
const FATTR4_SPACE_FREE		= 43;
const FATTR4_SPACE_TOTAL	= 44;
const FATTR4_SPACE_USED		= 45;
const FATTR4_SYSTEM		= 46;
const FATTR4_TIME_ACCESS	= 47;
const FATTR4_TIME_ACCESS_SET	= 48;
const FATTR4_TIME_BACKUP	= 49;
const FATTR4_TIME_CREATE	= 50;
const FATTR4_TIME_DELTA		= 51;
const FATTR4_TIME_METADATA	= 52;
const FATTR4_TIME_MODIFY	= 53;
const FATTR4_TIME_MODIFY_SET	= 54;
const FATTR4_MOUNTED_ON_FILEID	= 55;

%/*
% * new to NFSV4.1
% */
const FATTR4_DIR_NOTIF_DELAY	= 56;
const FATTR4_DIRENT_NOTIF_DELAY = 57;
const FATTR4_DACL		= 58;
const FATTR4_SACL		= 59;
const FATTR4_CHANGE_POLICY	= 60;
const FATTR4_FS_STATUS		= 61;
const FATTR4_FS_LAYOUT_TYPES	= 62;
const FATTR4_LAYOUT_HINT	= 63;
const FATTR4_LAYOUT_TYPES	= 64;
const FATTR4_LAYOUT_BLKSIZE	= 65;
const FATTR4_LAYOUT_ALIGNMENT	= 66;
const FATTR4_FS_LOCATIONS_INFO	= 67;
const FATTR4_MDSTHRESHOLD	= 68;
const FATTR4_RETENTION_GET	= 69;
const FATTR4_RETENTION_SET	= 70;
const FATTR4_RETENTEVT_GET	= 71;
const FATTR4_RETENTEVT_SET	= 72;
const FATTR4_RETENTION_HOLD	= 73;
const FATTR4_MODE_SET_MASKED	= 74;
const FATTR4_FS_CHARSET_CAP	= 76;

%/*
% * new to NFSV4.2
% */
const FATTR4_CLONE_BLKSIZE	= 77;
const FATTR4_SPACE_FREED	= 78;
const FATTR4_CHANGE_ATTR_TYPE	= 79;
const FATTR4_SEC_LABEL		= 80;

/*
 * File attribute container
 */
include(type_fattr4.x)
/*
 * Change info for the client
 */
include(type_change_info4.x)
typedef netaddr4 clientaddr4;

/*
 * Callback program info as provided by the client
 */
struct cb_client4 {
	uint32_t	cb_program;
	netaddr4	cb_location;
};

/*
 * NFSv4.0 Long Hand Client ID
 */
struct nfs_client_id4 {
	verifier4	verifier;
	opaque		id<NFS4_OPAQUE_LIMIT>;
};

/*
 * NFSv4.1 Client Owner (aka long hand client ID)
 */
include(type_client_owner4.x)

/*
 * NFSv4.1 server Owner
 */
include(type_server_owner4.x)

include(type_state_owner4.x)

enum nfs_lock_type4 {
	READ_LT		= 1,
	WRITE_LT	= 2,
	READW_LT	= 3,	/* blocking read */
	WRITEW_LT	= 4	/* blocking write */
};


include(type_ssv_subkey4.x)
include(type_ssv_mic_plain_tkn4.x)
include(type_ssv_mic_tkn4.x)
include(type_ssv_seal_plain_tkn4.x)
include(type_ssv_seal_cipher_tkn4.x)
