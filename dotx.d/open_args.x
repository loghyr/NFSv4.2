/*
 * Various definitions for OPEN
 */
enum createmode4 {
	UNCHECKED4	= 0,
	GUARDED4	= 1,
        /* Deprecated in NFSv4.1. */
	EXCLUSIVE4	= 2,
	/*
         * New to NFSv4.1. If session is persistent,
         * GUARDED4 MUST be used. Otherwise, use
         * EXCLUSIVE4_1 instead of EXCLUSIVE4.
         */
	EXCLUSIVE4_1	= 3
};

struct creatverfattr {
	 verifier4	cva_verf;
	 fattr4		cva_attrs;
};

union createhow4 switch (createmode4 mode) {
 case UNCHECKED4:
 case GUARDED4:
	 fattr4		createattrs;
 case EXCLUSIVE4:
	 verifier4	createverf;
 case EXCLUSIVE4_1:
	 creatverfattr	ch_createboth;
};

enum opentype4 {
	OPEN4_NOCREATE	= 0,
	OPEN4_CREATE	= 1
};

union openflag4 switch (opentype4 opentype) {
 case OPEN4_CREATE:
	 createhow4	how;
 default:
	 void;
};

/* Next definitions used for OPEN delegation */
enum limit_by4 {
	NFS_LIMIT_SIZE		= 1,
	NFS_LIMIT_BLOCKS	= 2
	/* others as needed */
};

struct nfs_modified_limit4 {
	uint32_t	num_blocks;
	uint32_t	bytes_per_block;
};

union nfs_space_limit4 switch (limit_by4 limitby) {
 /* limit specified as file size */
 case NFS_LIMIT_SIZE:
	 uint64_t		filesize;
 /* limit specified by number of blocks */
 case NFS_LIMIT_BLOCKS:
	 nfs_modified_limit4	mod_blocks;
} ;

/*
 * Share Access and Deny constants for open argument
 */
include(const_access_deny.x)

/* new flags for share_access field of OPEN4args */
const OPEN4_SHARE_ACCESS_WANT_DELEG_MASK	= 0xFF00;
const OPEN4_SHARE_ACCESS_WANT_NO_PREFERENCE	= 0x0000;
const OPEN4_SHARE_ACCESS_WANT_READ_DELEG	= 0x0100;
const OPEN4_SHARE_ACCESS_WANT_WRITE_DELEG	= 0x0200;
const OPEN4_SHARE_ACCESS_WANT_ANY_DELEG		= 0x0300;
const OPEN4_SHARE_ACCESS_WANT_NO_DELEG		= 0x0400;
const OPEN4_SHARE_ACCESS_WANT_CANCEL		= 0x0500;

const
 OPEN4_SHARE_ACCESS_WANT_SIGNAL_DELEG_WHEN_RESRC_AVAIL
 = 0x10000;

const
 OPEN4_SHARE_ACCESS_WANT_PUSH_DELEG_WHEN_UNCONTENDED
 = 0x20000;

enum open_delegation_type4 {
	OPEN_DELEGATE_NONE	= 0,
	OPEN_DELEGATE_READ	= 1,
	OPEN_DELEGATE_WRITE	= 2,
	OPEN_DELEGATE_NONE_EXT	= 3 /* new to v4.1 */
};

enum open_claim_type4 {
        /*
         * Not a reclaim.
         */
	CLAIM_NULL		= 0,

	CLAIM_PREVIOUS		= 1,
	CLAIM_DELEGATE_CUR	= 2,
	CLAIM_DELEGATE_PREV	= 3,

	/*
         * Not a reclaim.
         *
	 * Like CLAIM_NULL, but object identified
	 * by the current filehandle.
	 */
	CLAIM_FH		= 4, /* new to v4.1 */

	/*
	 * Like CLAIM_DELEGATE_CUR, but object identified
	 * by current filehandle.
	 */
	CLAIM_DELEG_CUR_FH	= 5, /* new to v4.1 */

	/*
	 * Like CLAIM_DELEGATE_PREV, but object identified
	 * by current filehandle.
	 */
	CLAIM_DELEG_PREV_FH	= 6 /* new to v4.1 */
};

struct open_claim_delegate_cur4 {
	stateid4	delegate_stateid;
	component4	file;
};

union open_claim4 switch (open_claim_type4 claim) {
 /*
  * No special rights to file.
  * Ordinary OPEN of the specified file.
  */
 case CLAIM_NULL:
	/* CURRENT_FH: directory */
	component4	file;
 /*
  * Right to the file established by an
  * open previous to server reboot. File
  * identified by filehandle obtained at
  * that time rather than by name.
  */
 case CLAIM_PREVIOUS:
	/* CURRENT_FH: file being reclaimed */
	open_delegation_type4	delegate_type;

 /*
  * Right to file based on a delegation
  * granted by the server. File is
  * specified by name.
  */
 case CLAIM_DELEGATE_CUR:
	/* CURRENT_FH: directory */
	open_claim_delegate_cur4	delegate_cur_info;

 /*
  * Right to file based on a delegation
  * granted to a previous boot instance
  * of the client.  File is specified by name.
  */
 case CLAIM_DELEGATE_PREV:
	 /* CURRENT_FH: directory */
	component4	file_delegate_prev;

 /*
  * Like CLAIM_NULL.  No special rights
  * to file.  Ordinary OPEN of the
  * specified file by current filehandle.
  */
 case CLAIM_FH: /* new to v4.1 */
	/* CURRENT_FH: regular file to open */
	void;

 /*
  * Like CLAIM_DELEGATE_PREV.  Right to file based on a
  * delegation granted to a previous boot
  * instance of the client.  File is identified by
  * by filehandle.
  */
 case CLAIM_DELEG_PREV_FH: /* new to v4.1 */
	/* CURRENT_FH: file being opened */
	void;

 /*
  * Like CLAIM_DELEGATE_CUR.  Right to file based on
  * a delegation granted by the server.
  * File is identified by filehandle.
  */
 case CLAIM_DELEG_CUR_FH: /* new to v4.1 */
	 /* CURRENT_FH: file being opened */
	 stateid4	oc_delegate_stateid;

};

/*
 * OPEN: Open a file, potentially receiving an open delegation
 */
struct OPEN4args {
	seqid4		seqid;
	uint32_t	share_access;
	uint32_t	share_deny;
	open_owner4	owner;
	openflag4	openhow;
	open_claim4	claim;
};

