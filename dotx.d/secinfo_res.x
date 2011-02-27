/*
 * From RFC 2203
 */
enum rpc_gss_svc_t {
	RPC_GSS_SVC_NONE	= 1,
	RPC_GSS_SVC_INTEGRITY	= 2,
	RPC_GSS_SVC_PRIVACY	= 3
};

struct rpcsec_gss_info {
	sec_oid4	oid;
	qop4		qop;
	rpc_gss_svc_t	service;
};

/* RPCSEC_GSS has a value of '6' - See RFC 2203 */
union secinfo4 switch (uint32_t flavor) {
 case RPCSEC_GSS:
	 rpcsec_gss_info	flavor_info;
 default:
	 void;
};

typedef secinfo4 SECINFO4resok<>;

union SECINFO4res switch (nfsstat4 status) {
 case NFS4_OK:
	/* CURRENTFH: consumed */
	 SECINFO4resok resok4;
 default:
	 void;
};

