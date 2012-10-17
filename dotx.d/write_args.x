struct WRITE4args {
	/* CURRENT_FH: file */
	stateid4	stateid;
	offset4		offset;
	stable_how4	stable;
	opaque		data<>;
};

