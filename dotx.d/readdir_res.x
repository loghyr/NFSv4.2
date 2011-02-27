struct entry4 {
	nfs_cookie4	cookie;
	component4	name;
	fattr4		attrs;
	entry4		*nextentry;
};

struct dirlist4 {
	entry4		*entries;
	bool		eof;
};

struct READDIR4resok {
	verifier4	cookieverf;
	dirlist4	reply;
};


union READDIR4res switch (nfsstat4 status) {
 case NFS4_OK:
	 READDIR4resok	resok4;
 default:
	 void;
};


