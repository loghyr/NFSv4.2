struct GETDEVICELIST4args {
	/* CURRENT_FH: object belonging to the file system */
	layouttype4	gdla_layout_type;

        /* number of deviceIDs to return */
	count4		gdla_maxdevices;

	nfs_cookie4	gdla_cookie;
	verifier4	gdla_cookieverf;
};

