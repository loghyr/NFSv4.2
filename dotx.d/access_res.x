struct ACCESS4resok {
	uint32_t	supported;
	uint32_t	access;
};

union ACCESS4res switch (nfsstat4 status) {
 case NFS4_OK:
	 ACCESS4resok	resok4;
 default:
	 void;
};

