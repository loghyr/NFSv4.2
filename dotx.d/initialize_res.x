
struct INITIALIZE4resok {
	count4		ir_count;
	stable_how4	ir_committed;
	verifier4	ir_writeverf;
	data_content4	ir_sparse;
};

union INITIALIZE4res switch (nfsstat4 status) {
case NFS4_OK:
	INITIALIZE4resok	resok4;
default:
	void;
};

