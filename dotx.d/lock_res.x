struct LOCK4denied {
	offset4		offset;
	length4		length;
	nfs_lock_type4	locktype;
	lock_owner4	owner;
};

struct LOCK4resok {
	stateid4	lock_stateid;
};

union LOCK4res switch (nfsstat4 status) {
 case NFS4_OK:
	 LOCK4resok	resok4;
 case NFS4ERR_DENIED:
	 LOCK4denied	denied;
 default:
	 void;
};

