struct COPY_STATUS4resok {
	length4		csr_bytes_copied;
	nfsstat4	csr_complete<1>;
};

union COPY_STATUS4res switch (nfsstat4 csr_status) {
	case NFS4_OK:
		COPY_STATUS4resok	resok4;
	default:
		void;
};

