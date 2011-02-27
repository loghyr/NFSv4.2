struct REMOVE4resok {
	change_info4	cinfo;
};

union REMOVE4res switch (nfsstat4 status) {
 case NFS4_OK:
	 REMOVE4resok	resok4;
 default:
	 void;
};

