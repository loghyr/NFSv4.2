union COPY4res switch (nfsstat4 cr_status) {
case NFS4_OK:
	write_response4	resok4;
default:
	length4		cr_bytes_copied;
};

