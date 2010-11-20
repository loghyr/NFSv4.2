struct GET_DIR_DELEGATION4resok {
	verifier4	gddr_cookieverf;
	/* Stateid for get_dir_delegation */
	stateid4	gddr_stateid;
	/* Which notifications can the server support */
	bitmap4		gddr_notification;
	bitmap4		gddr_child_attributes;
	bitmap4		gddr_dir_attributes;
};

enum gddrnf4_status {
	GDD4_OK		= 0,
        GDD4_UNAVAIL	= 1
};

union GET_DIR_DELEGATION4res_non_fatal
 switch (gddrnf4_status gddrnf_status) {
 case GDD4_OK:
  GET_DIR_DELEGATION4resok	gddrnf_resok4;
 case GDD4_UNAVAIL:
  bool				gddrnf_will_signal_deleg_avail;
};

union GET_DIR_DELEGATION4res
 switch (nfsstat4 gddr_status) {
 case NFS4_OK:
  GET_DIR_DELEGATION4res_non_fatal	gddr_res_non_fatal4;
 default:
  void;
};

