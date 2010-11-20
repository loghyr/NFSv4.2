union LOCKT4res switch (nfsstat4 status) {
 case NFS4ERR_DENIED:
	 LOCK4denied	denied;
 case NFS4_OK:
	 void;
 default:
	 void;
};

