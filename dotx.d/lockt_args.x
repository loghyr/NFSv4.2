struct LOCKT4args {
	/* CURRENT_FH: file */
	nfs_lock_type4	locktype;
	offset4		offset;
	length4		length;
	lock_owner4	owner;
};

