enum IO_ADVISE_type4 {
	IO_ADVISE4_NORMAL			= 0,
	IO_ADVISE4_SEQUENTIAL			= 1,
	IO_ADVISE4_SEQUENTIAL_BACKWARDS		= 2,
	IO_ADVISE4_RANDOM			= 3,
	IO_ADVISE4_WILLNEED			= 4,
	IO_ADVISE4_WILLNEED_OPPORTUNISTIC	= 5,
	IO_ADVISE4_DONTNEED			= 6,
	IO_ADVISE4_NOREUSE			= 7,
	IO_ADVISE4_READ				= 8,
	IO_ADVISE4_WRITE			= 9,
};

struct IO_ADVISE4args {
	/* CURRENT_FH: file */
	stateid4	iar_stateid;
	offset4		iar_offset;
	length4		iar_count;
	bitmap4		iar_hints;
};
