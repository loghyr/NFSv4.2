struct channel_attrs4 {
        count4                  ca_headerpadsize;
	count4			ca_maxrequestsize;
	count4			ca_maxresponsesize;
	count4                  ca_maxresponsesize_cached;
	count4			ca_maxoperations;
	count4			ca_maxrequests;
	uint32_t		ca_rdma_ird<1>;
};

const CREATE_SESSION4_FLAG_PERSIST		= 0x00000001;
const CREATE_SESSION4_FLAG_CONN_BACK_CHAN	= 0x00000002;
const CREATE_SESSION4_FLAG_CONN_RDMA		= 0x00000004;

struct CREATE_SESSION4args {
	clientid4		csa_clientid;
	sequenceid4		csa_sequence;

        uint32_t		csa_flags;

	channel_attrs4		csa_fore_chan_attrs;
	channel_attrs4		csa_back_chan_attrs;

	uint32_t		csa_cb_program;
	callback_sec_parms4	csa_sec_parms<>;
};

