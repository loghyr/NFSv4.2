
struct WRITE_PLUS4resok {
	count4		wpr_count;
	stable_how4	wpr_committed;
	verifier4	wpr_writeverf;
	data_content4	wpr_sparse;
};

union WRITE_PLUS4res switch (nfsstat4 status) {
case NFS4_OK:
	WRITE_PLUS4resok	resok4;
default:
	void;
};

