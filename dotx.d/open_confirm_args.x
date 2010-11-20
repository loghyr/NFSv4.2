/* obsolete in NFSv4.1 */
struct OPEN_CONFIRM4args {
	/* CURRENT_FH: opened file */
	stateid4	open_stateid;
	seqid4		seqid;
};

