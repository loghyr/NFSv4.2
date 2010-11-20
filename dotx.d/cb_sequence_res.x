struct CB_SEQUENCE4resok {
	sessionid4	   csr_sessionid;
	sequenceid4	   csr_sequenceid;
	slotid4		   csr_slotid;
	slotid4		   csr_highest_slotid;
	slotid4		   csr_target_highest_slotid;
};

union CB_SEQUENCE4res switch (nfsstat4 csr_status) {
case NFS4_OK:
	CB_SEQUENCE4resok   csr_resok4;
default:
	void;
};

