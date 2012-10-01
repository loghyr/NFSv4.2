
const COPY4_GUARDED	= 0x00000001;
const COPY4_METADATA	= 0x00000002;

struct COPY4args {
	/* SAVED_FH: source file */
	/* CURRENT_FH: destination file or */
	/*             directory           */
	stateid4	ca_src_stateid;
	stateid4	ca_dst_stateid;
	offset4		ca_src_offset;
	offset4		ca_dst_offset;
	length4		ca_count;
	uint32_t	ca_flags;
	component4	ca_destination;
	netloc4		ca_source_server<>;
};

