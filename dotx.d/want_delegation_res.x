union WANT_DELEGATION4res switch (nfsstat4 wdr_status) {
case NFS4_OK:
	open_delegation4 wdr_resok4;
default:
	void;
};

