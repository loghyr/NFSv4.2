struct COPY4args {
	/* SAVED_FH: source file */
	/* CURRENT_FH: destination file */
	stateid4	ca_src_stateid;
	stateid4	ca_dst_stateid;
	offset4		ca_src_offset;
	offset4		ca_dst_offset;
	length4		ca_count;
	netloc4		ca_source_server<>;
};

