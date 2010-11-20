enum channel_dir_from_server4 {
 CDFS4_FORE	= 0x1,
 CDFS4_BACK	= 0x2,
 CDFS4_BOTH	= 0x3
};

struct BIND_CONN_TO_SESSION4resok {
 sessionid4	bctsr_sessid;

 channel_dir_from_server4
		bctsr_dir;

 bool		bctsr_use_conn_in_rdma_mode;
};

union BIND_CONN_TO_SESSION4res
 switch (nfsstat4 bctsr_status) {

 case NFS4_OK:
  BIND_CONN_TO_SESSION4resok
		bctsr_resok4;

 default:	void;
};

