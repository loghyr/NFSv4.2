enum channel_dir_from_client4 {
 CDFC4_FORE		= 0x1,
 CDFC4_BACK		= 0x2,
 CDFC4_FORE_OR_BOTH	= 0x3,
 CDFC4_BACK_OR_BOTH	= 0x7
};

struct BIND_CONN_TO_SESSION4args {
 sessionid4	bctsa_sessid;

 channel_dir_from_client4
                bctsa_dir;

 bool		bctsa_use_conn_in_rdma_mode;
};

