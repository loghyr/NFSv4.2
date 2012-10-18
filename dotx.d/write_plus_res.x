
union WRITE_PLUS4res switch (nfsstat4 wp_status) {
case NFS4_OK:
	write_response4		wp_resok4;
default:
	void;
};

