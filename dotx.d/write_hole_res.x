
union WRITE_HOLE4res switch (nfsstat4 wh_status) {
case NFS4_OK:
	write_response4		wh_resok4;
default:
	void;
};

