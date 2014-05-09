union SEEK4res switch (nfsstat4 sa_status) {
case NFS4_OK:
	seek_res4	resok4;
default:
	void;
};
