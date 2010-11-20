union LOCKU4res switch (nfsstat4 status) {
 case	NFS4_OK:
	 stateid4	lock_stateid;
 default:
	 void;
};

