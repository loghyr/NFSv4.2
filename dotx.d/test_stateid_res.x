struct TEST_STATEID4resok {
	nfsstat4	tsr_status_codes<>;
};

union TEST_STATEID4res switch (nfsstat4 tsr_status) {
    case NFS4_OK:
	TEST_STATEID4resok tsr_resok4;
    default:
	void;
};

