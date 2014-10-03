union WRITE_SAME4res switch (nfsstat4 wsr_status) {
case NFS4_OK:
	write_response4		resok4;
default:
	void;
};

