
struct IO_ADVISE4resok {
	bitmap4	ior_hints;
};

union IO_ADVISE4res switch (nfsstat4 ior_status) {
case NFS4_OK:
	IO_ADVISE4resok	resok4;
default:
	void;
};

