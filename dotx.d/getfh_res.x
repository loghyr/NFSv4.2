struct GETFH4resok {
	nfs_fh4		object;
};

union GETFH4res switch (nfsstat4 status) {
 case NFS4_OK:
	GETFH4resok	resok4;
 default:
	void;
};

