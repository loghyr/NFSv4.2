
union read_plus_content switch (data_content4 content) {
case NFS4_CONTENT_DATA:
	opaque		rpc_data<>;
case NFS4_CONTENT_APP_DATA_HOLE:
	app_data_hole4	rpc_adh;
case NFS4_CONTENT_HOLE:
	data_info4	rpc_hole;
default:
	void;
};

/*
 * Allow a return of an array of contents.
 */
struct read_plus_res4 {
	bool			rpr_eof;
	read_plus_content	rpr_contents<>;
};

union READ_PLUS4res switch (nfsstat4 status) {
case NFS4_OK:
	read_plus_res4	resok4;
default:
	void;
};

