struct SEEK4args {
	/* CURRENT_FH: file */
	stateid4        sa_stateid;
	offset4         sa_offset;
	data_content4	sa_what;
};
