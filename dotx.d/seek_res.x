
union seek_content switch (data_content4 content) {
case NFS4_CONTENT_DATA:
	data_info4	sc_data;
case NFS4_CONTENT_HOLE:
	data_info4	sc_hole;
default:
	void;
};

struct seek_res4 {
	bool			sr_eof;
	seek_content		sr_contents;
};

union SEEK4res switch (nfsstat4 status) {
case NFS4_OK:
	seek_res4	resok4;
default:
	void;
};
