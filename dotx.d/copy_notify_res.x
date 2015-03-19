struct COPY_NOTIFY4resok {
	nfstime4	cnr_lease_time;
	stateid4	cnr_stateid;
	netloc4		cnr_source_server<>;
};

union COPY_NOTIFY4res switch (nfsstat4 cnr_status) {
case NFS4_OK:
	COPY_NOTIFY4resok	resok4;
default:
	void;
};

