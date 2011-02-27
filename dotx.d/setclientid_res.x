struct SETCLIENTID4resok {
	clientid4	clientid;
	verifier4	setclientid_confirm;
};

union SETCLIENTID4res switch (nfsstat4 status) {
 case NFS4_OK:
	 SETCLIENTID4resok	resok4;
 case NFS4ERR_CLID_INUSE:
	 clientaddr4	client_using;
 default:
	 void;
};

