struct READDIR4args {
	/* CURRENT_FH: directory */
	nfs_cookie4	cookie;
	verifier4	cookieverf;
	count4		dircount;
	count4		maxcount;
	bitmap4		attr_request;
};

