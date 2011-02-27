struct LINK4resok {
	change_info4	cinfo;
};

union LINK4res switch (nfsstat4 status) {
 case NFS4_OK:
	 LINK4resok resok4;
 default:
	 void;
};

