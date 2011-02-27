struct OPEN_DOWNGRADE4resok {
	stateid4	open_stateid;
};

union OPEN_DOWNGRADE4res switch(nfsstat4 status) {
 case NFS4_OK:
	OPEN_DOWNGRADE4resok	resok4;
 default:
	 void;
};

