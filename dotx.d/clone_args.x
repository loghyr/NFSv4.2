struct CLONE4args {
	/* SAVED_FH: source file */
	/* CURRENT_FH: destination file */
	stateid4	cl_src_stateid;
	stateid4	cl_dst_stateid;
	offset4		cl_src_offset;
	offset4		cl_dst_offset;
	length4		cl_count;
};

