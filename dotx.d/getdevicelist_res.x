struct GETDEVICELIST4resok {
	nfs_cookie4		gdlr_cookie;
	verifier4		gdlr_cookieverf;
	deviceid4		gdlr_deviceid_list<>;
	bool			gdlr_eof;
};

union GETDEVICELIST4res switch (nfsstat4 gdlr_status) {
case NFS4_OK:
	GETDEVICELIST4resok	gdlr_resok4;
default:
	void;
};

