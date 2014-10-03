struct IO_ADVISE4args {
	/* CURRENT_FH: file */
	stateid4	iaa_stateid;
	offset4		iaa_offset;
	length4		iaa_count;
	bitmap4		iaa_hints;
};
