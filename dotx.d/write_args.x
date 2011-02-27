enum stable_how4 {
	UNSTABLE4	= 0,
	DATA_SYNC4	= 1,
	FILE_SYNC4	= 2
};

struct WRITE4args {
	/* CURRENT_FH: file */
	stateid4	stateid;
	offset4		offset;
	stable_how4	stable;
	opaque		data<>;
};

