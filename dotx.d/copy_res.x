union COPY4res switch (nfsstat4 cr_status) {
	/* CURRENT_FH: destination file */

	case NFS4_OK:
		stateid4	cr_callback_id<1>;
	default:
		length4		cr_bytes_copied;
};

