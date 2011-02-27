struct ssv_prot_info4 {
 state_protect_ops4	spi_ops;
 uint32_t		spi_hash_alg;
 uint32_t		spi_encr_alg;
 uint32_t		spi_ssv_len;
 uint32_t		spi_window;
 gsshandle4_t		spi_handles<>;
};

union state_protect4_r switch(state_protect_how4 spr_how) {
 case SP4_NONE:
	 void;
 case SP4_MACH_CRED:
	 state_protect_ops4	spr_mach_ops;
 case SP4_SSV:
	 ssv_prot_info4		spr_ssv_info;
};

struct EXCHANGE_ID4resok {
 clientid4	  eir_clientid;
 sequenceid4	  eir_sequenceid;
 uint32_t	  eir_flags;
 state_protect4_r eir_state_protect;
 server_owner4	  eir_server_owner;
 opaque		  eir_server_scope<NFS4_OPAQUE_LIMIT>;
 nfs_impl_id4	  eir_server_impl_id<1>;
};

union EXCHANGE_ID4res switch (nfsstat4 eir_status) {
case NFS4_OK:
 EXCHANGE_ID4resok	eir_resok4;

default:
 void;
};

