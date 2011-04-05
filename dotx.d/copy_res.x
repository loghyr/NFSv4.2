union COPY4res switch (nfsstat4 cr_status) {
	case NFS4_OK:
		stateid4	cr_callback_id<1>;
	default:
		length4		cr_bytes_copied;
};

