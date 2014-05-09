
union READ_PLUS4res switch (nfsstat4 rp_status) {
case NFS4_OK:
	read_plus_res4	rp_resok4;
default:
	void;
};

