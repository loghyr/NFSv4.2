union copy_info4 switch (nfsstat4 cca_status) {
	case NFS4_OK:
		void;
	default:
		length4		cca_bytes_copied;
};

struct CB_COPY4args {
	nfs_fh4		cca_fh;
	stateid4	cca_stateid;
	copy_info4	cca_copy_info;
};
