typedef opaque gsshandle4_t<>;

struct gss_cb_handles4 {
	rpc_gss_svc_t		gcbp_service; /* RFC 2203 */
	gsshandle4_t		gcbp_handle_from_server;
	gsshandle4_t		gcbp_handle_from_client;
};

union callback_sec_parms4 switch (uint32_t cb_secflavor) {
case AUTH_NONE:
	void;
case AUTH_SYS:
	authsys_parms	cbsp_sys_cred; /* RFC 1831 */
case RPCSEC_GSS:
	gss_cb_handles4 cbsp_gss_handles;
};

struct BACKCHANNEL_CTL4args {
	uint32_t		bca_cb_program;
	callback_sec_parms4     bca_sec_parms<>;
};

