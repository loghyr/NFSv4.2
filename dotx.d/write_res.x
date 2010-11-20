struct WRITE4resok {
	count4		count;
	stable_how4	committed;
	verifier4	writeverf;
};

union WRITE4res switch (nfsstat4 status) {
 case NFS4_OK:
	 WRITE4resok	resok4;
 default:
	 void;
};

