struct READ4resok {
	bool		eof;
	opaque		data<>;
};

union READ4res switch (nfsstat4 status) {
 case NFS4_OK:
	 READ4resok	resok4;
 default:
	 void;
};

