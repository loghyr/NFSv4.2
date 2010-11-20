union createtype4 switch (nfs_ftype4 type) {
 case NF4LNK:
	 linktext4 linkdata;
 case NF4BLK:
 case NF4CHR:
	 specdata4 devdata;
 case NF4SOCK:
 case NF4FIFO:
 case NF4DIR:
	 void;
 default:
	 void;	/* server should return NFS4ERR_BADTYPE */
};

struct CREATE4args {
	/* CURRENT_FH: directory for creation */
	createtype4	objtype;
	component4	objname;
	fattr4		createattrs;
};

