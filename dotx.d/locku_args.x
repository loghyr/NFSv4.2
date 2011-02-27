struct LOCKU4args {
	/* CURRENT_FH: file */
	nfs_lock_type4	locktype;
	seqid4		seqid;
	stateid4	lock_stateid;
	offset4		offset;
	length4		length;
};

