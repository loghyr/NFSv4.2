struct OFFLOAD_STATUS4resok {
	length4		osr_bytes_copied;
	nfsstat4	osr_complete<1>;
};

union OFFLOAD_STATUS4res switch (nfsstat4 osr_status) {
	case NFS4_OK:
		OFFLOAD_STATUS4resok	resok4;
	default:
		void;
};

