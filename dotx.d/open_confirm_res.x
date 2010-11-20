struct OPEN_CONFIRM4resok {
	stateid4	open_stateid;
};

union OPEN_CONFIRM4res switch (nfsstat4 status) {
 case NFS4_OK:
	 OPEN_CONFIRM4resok	resok4;
 default:
	 void;
};

