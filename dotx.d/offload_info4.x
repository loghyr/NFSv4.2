union offload_info4 switch (nfsstat4 coa_status) {
case NFS4_OK:
	write_response4	coa_resok4;
default:
	length4		coa_bytes_copied;
};
