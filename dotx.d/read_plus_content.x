union read_plus_content switch (data_content4 rpc_content) {
case NFS4_CONTENT_DATA:
	data4		rpc_data;
case NFS4_CONTENT_HOLE:
	data_info4	rpc_hole;
default:
	void;
};
