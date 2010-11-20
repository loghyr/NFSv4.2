struct COMMIT4resok {
	verifier4	writeverf;
};

union COMMIT4res switch (nfsstat4 status) {
 case NFS4_OK:
	 COMMIT4resok	resok4;
 default:
	 void;
};

