
union WRITE_PLUS4res switch (nfsstat4 status) {
case NFS4_OK:
	write_response4		resok4;
default:
	void;
};

