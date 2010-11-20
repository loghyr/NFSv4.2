struct ssr_digest_input4 {
        SEQUENCE4res sdi_seqres;
};

struct SET_SSV4resok {
	opaque		ssr_digest<>;
};

union SET_SSV4res switch (nfsstat4 ssr_status) {
case NFS4_OK:
	SET_SSV4resok	ssr_resok4;
default:
	void;
};

