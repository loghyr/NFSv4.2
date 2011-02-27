struct GETDEVICEINFO4resok {
        device_addr4	gdir_device_addr;
	bitmap4		gdir_notification;
};

union GETDEVICEINFO4res switch (nfsstat4 gdir_status) {
case NFS4_OK:
        GETDEVICEINFO4resok     gdir_resok4;
case NFS4ERR_TOOSMALL:
        count4			gdir_mincount;
default:
        void;
};

