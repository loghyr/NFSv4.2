const EXCHGID4_FLAG_SUPP_MOVED_REFER 	= 0x00000001;
const EXCHGID4_FLAG_SUPP_MOVED_MIGR 	= 0x00000002;

const EXCHGID4_FLAG_BIND_PRINC_STATEID 	= 0x00000100;

const EXCHGID4_FLAG_USE_NON_PNFS 	= 0x00010000;
const EXCHGID4_FLAG_USE_PNFS_MDS 	= 0x00020000;
const EXCHGID4_FLAG_USE_PNFS_DS		= 0x00040000;

const EXCHGID4_FLAG_MASK_PNFS    	= 0x00070000;

const EXCHGID4_FLAG_UPD_CONFIRMED_REC_A = 0x40000000;
const EXCHGID4_FLAG_CONFIRMED_R      	= 0x80000000;

struct state_protect_ops4 {
	bitmap4 spo_must_enforce;
        bitmap4 spo_must_allow;
};

struct ssv_sp_parms4 {
	state_protect_ops4	ssp_ops;
	sec_oid4		ssp_hash_algs<>;
	sec_oid4		ssp_encr_algs<>;
	uint32_t		ssp_window;
        uint32_t		ssp_num_gss_handles;
};

enum state_protect_how4 {
	SP4_NONE = 0,
	SP4_MACH_CRED = 1,
	SP4_SSV = 2
};

union state_protect4_a switch(state_protect_how4 spa_how) {
	case SP4_NONE:
		void;
	case SP4_MACH_CRED:
		state_protect_ops4	spa_mach_ops;
	case SP4_SSV:
		ssv_sp_parms4		spa_ssv_parms;
};

struct EXCHANGE_ID4args {
	client_owner4		eia_clientowner;
        uint32_t        	eia_flags;
        state_protect4_a	eia_state_protect;
	nfs_impl_id4		eia_client_impl_id<1>;
};

