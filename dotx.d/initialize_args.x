
/*
 * We use data_content4 in case we wish to
 * extend new types later. Note that we
 * are explicitly disallowing data.
 */
union initialize_arg4 switch (data_content4 content) {
case NFS4_CONTENT_APP_BLOCK:
	app_data_block4	ia_adb;
case NFS4_CONTENT_HOLE:
	length4		ia_hole_length;
default:
	void;
};

struct INITIALIZE4args {
	/* CURRENT_FH: file */
	stateid4	ia_stateid;
	stable_how4	ia_stable;
	offset4		ia_offset;
	initialize_arg4	ia_data<>;
};

