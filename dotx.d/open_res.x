struct open_read_delegation4 {
 stateid4 stateid;    /* Stateid for delegation*/
 bool	  recall;     /* Pre-recalled flag for
                         delegations obtained
                         by reclaim (CLAIM_PREVIOUS) */

 nfsace4 permissions; /* Defines users who don't
			 need an ACCESS call to
			 open for read */
};

struct open_write_delegation4 {
 stateid4 stateid;	/* Stateid for delegation */
 bool	  recall;	/* Pre-recalled flag for
			   delegations obtained
			   by reclaim
			   (CLAIM_PREVIOUS) */

 nfs_space_limit4
           space_limit;	/* Defines condition that
			   the client must check to
			   determine whether the
			   file needs to be flushed
			   to the server on close.  */

 nfsace4   permissions;	/* Defines users who don't
			   need an ACCESS call as
			   part of a delegated
			   open. */
};


enum why_no_delegation4 { /* new to v4.1 */
	WND4_NOT_WANTED		= 0,
	WND4_CONTENTION		= 1,
	WND4_RESOURCE		= 2,
	WND4_NOT_SUPP_FTYPE	= 3,
	WND4_WRITE_DELEG_NOT_SUPP_FTYPE = 4,
	WND4_NOT_SUPP_UPGRADE	= 5,
	WND4_NOT_SUPP_DOWNGRADE	= 6,
	WND4_CANCELLED		= 7,
	WND4_IS_DIR		= 8
};

union open_none_delegation4 /* new to v4.1 */
switch (why_no_delegation4 ond_why) {
	case WND4_CONTENTION:
		bool ond_server_will_push_deleg;
	case WND4_RESOURCE:
		bool ond_server_will_signal_avail;
	default:
		void;
};

union open_delegation4
switch (open_delegation_type4 delegation_type) {
	case OPEN_DELEGATE_NONE:
		void;
	case OPEN_DELEGATE_READ:
		open_read_delegation4 read;
	case OPEN_DELEGATE_WRITE:
		open_write_delegation4 write;
	case OPEN_DELEGATE_NONE_EXT: /* new to v4.1 */
		open_none_delegation4 od_whynone;
};

/*
 * Result flags
 */

/* Client must confirm open */
const OPEN4_RESULT_CONFIRM	= 0x00000002;
/* Type of file locking behavior at the server */
const OPEN4_RESULT_LOCKTYPE_POSIX = 0x00000004;
/* Server will preserve file if removed while open */
const OPEN4_RESULT_PRESERVE_UNLINKED = 0x00000008;

/*
 * Server may use CB_NOTIFY_LOCK on locks
 * derived from this open
 */
const OPEN4_RESULT_MAY_NOTIFY_LOCK = 0x00000020;

struct OPEN4resok {
 stateid4	stateid;      /* Stateid for open */
 change_info4	cinfo;        /* Directory Change Info */
 uint32_t	rflags;       /* Result flags */
 bitmap4	attrset;      /* attribute set for create*/
 open_delegation4 delegation; /* Info on any open
				 delegation */
};

union OPEN4res switch (nfsstat4 status) {
 case NFS4_OK:
	/* New CURRENT_FH: opened file */
	OPEN4resok	resok4;
 default:
	void;
};

