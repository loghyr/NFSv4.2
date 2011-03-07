union nfs_readplusreshole switch  (holeres4 resop) {
	CASE HOLE_NOINFO:
		void;
	CASE HOLE_INFO:
		offset4		hole_offset;
		length4		hole_length;
};

union nfs_readplusresok4 switch  (readplusrestype4 resop) {
	CASE READ_OK:
		opaque			data<>;
	CASE READ_HOLE:
		nfs_readplusreshole	reshole4;
};

union READPLUS4res switch (nfsstat4 status) {
	case NFS4_OK:
		bool		eof;
		nfs_readresok4	resok4;
	default:
		void;
};
