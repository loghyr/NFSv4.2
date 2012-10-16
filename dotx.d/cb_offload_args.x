union offload_info4 switch (nfsstat4 coa_status) {
	case NFS4_OK:
		void;
	default:
		length4		coa_bytes_copied;
};

struct CB_OFFLOAD4args {
	nfs_fh4		coa_fh;
	stateid4	coa_stateid;
	offload_info4	coa_offload_info;
};
