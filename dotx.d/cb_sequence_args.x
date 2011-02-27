struct referring_call4 {
	sequenceid4	rc_sequenceid;
	slotid4		rc_slotid;
};

struct referring_call_list4 {
	sessionid4	rcl_sessionid;
	referring_call4 rcl_referring_calls<>;
};

struct CB_SEQUENCE4args {
	sessionid4	     csa_sessionid;
	sequenceid4	     csa_sequenceid;
	slotid4		     csa_slotid;
	slotid4		     csa_highest_slotid;
        bool		     csa_cachethis;
	referring_call_list4 csa_referring_call_lists<>;
};

