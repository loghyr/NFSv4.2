struct CREATE_SESSION4resok {
	sessionid4		csr_sessionid;
	sequenceid4		csr_sequence;

	uint32_t		csr_flags;

	channel_attrs4		csr_fore_chan_attrs;
	channel_attrs4		csr_back_chan_attrs;
};

union CREATE_SESSION4res switch (nfsstat4 csr_status) {
case NFS4_OK:
	CREATE_SESSION4resok	csr_resok4;
default:
	void;
};

