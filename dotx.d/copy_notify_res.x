union COPY_NOTIFY4res switch (nfsstat4 cnr_status) {
	case NFS4_OK:
		nfstime4	cnr_lease_time;
		netloc4		cnr_source_server<>;
	default:
		void;
};

