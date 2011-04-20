struct read_plus_hole_info {
	offset4		rphi_offset;
	length4		rphi_length;
};

enum holeres4 {
	HOLE_NOINFO = 0,
	HOLE_INFO = 1
};

union read_plus_hole switch (holeres4 resop) {
	case HOLE_INFO:
		read_plus_hole_info	rph_info;
	case HOLE_NOINFO:
		void;
};

enum read_plusrestype4 {
	READ_OK = 0,
	READ_HOLE = 1
};

union read_plus_data switch (read_plusrestype4 resop) {
	case READ_OK:
		opaque		rpd_data<>;
	case READ_HOLE:
		read_plus_hole	rpd_hole4;
};

struct READ_PLUS4resok {
	bool		rpr_eof;
	read_plus_data	rpr_data;
};

union READ_PLUS4res switch (nfsstat4 status) {
	case NFS4_OK:
		READ_PLUS4resok	resok4;
	default:
		void;
};
