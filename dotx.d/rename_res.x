struct RENAME4resok {
	change_info4	source_cinfo;
	change_info4	target_cinfo;
};

union RENAME4res switch (nfsstat4 status) {
 case NFS4_OK:
	RENAME4resok	resok4;
 default:
	void;
};

