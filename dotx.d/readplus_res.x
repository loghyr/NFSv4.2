struct ressdplus_hole_info {
	offset4		rphi_offset;
	length4		rphi_length;
};

enum holeres4 {
	HOLE_NOINFO = 0,
	HOLE_INFO = 1
};

union readplus_hole switch (holeres4 resop) {
	case HOLE_INFO:
		ressdplus_hole_info	rph_info;
	case HOLE_NOINFO:
		void;
};

enum readplusrestype4 {
	READ_OK = 0,
	READ_HOLE = 1
};

union readplus_data switch (readplusrestype4 resop) {
	case READ_OK:
		opaque		rpd_data<>;
	case READ_HOLE:
		readplus_hole	rpd_hole4;
};

struct READPLUS4resok {
	bool		rpr_eof;
	readplus_data	rpr_data;
};

union READPLUS4res switch (nfsstat4 status) {
	case NFS4_OK:
		READPLUS4resok	resok4;
	default:
		void;
};
