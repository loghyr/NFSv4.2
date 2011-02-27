struct GETATTR4resok {
	fattr4		obj_attributes;
};

union GETATTR4res switch (nfsstat4 status) {
 case NFS4_OK:
	 GETATTR4resok	resok4;
 default:
	 void;
};

