struct CB_GETATTR4resok {
	fattr4	obj_attributes;
};

union CB_GETATTR4res switch (nfsstat4 status) {
 case NFS4_OK:
	 CB_GETATTR4resok	resok4;
 default:
	 void;
};

