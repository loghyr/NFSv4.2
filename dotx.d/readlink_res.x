struct READLINK4resok {
	linktext4	link;
};

union READLINK4res switch (nfsstat4 status) {
 case NFS4_OK:
	 READLINK4resok resok4;
 default:
	 void;
};

