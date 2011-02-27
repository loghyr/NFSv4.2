struct OPEN_DOWNGRADE4args {
	/* CURRENT_FH: opened file */
	stateid4	open_stateid;
	seqid4		seqid;
	uint32_t	share_access;
	uint32_t	share_deny;
};

