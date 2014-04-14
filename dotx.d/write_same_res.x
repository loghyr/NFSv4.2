
union WRITE_SAME4res switch (nfsstat4 ws_status) {
case NFS4_OK:
	write_response4		ws_resok4;
default:
	void;
};

