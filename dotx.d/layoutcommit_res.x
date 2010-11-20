union newsize4 switch (bool ns_sizechanged) {
case TRUE:
	length4		ns_size;
case FALSE:
	void;
};

struct LAYOUTCOMMIT4resok {
	newsize4		locr_newsize;
};

union LAYOUTCOMMIT4res switch (nfsstat4 locr_status) {
case NFS4_OK:
	LAYOUTCOMMIT4resok	locr_resok4;
default:
	void;
};

