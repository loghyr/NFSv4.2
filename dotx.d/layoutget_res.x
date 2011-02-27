struct LAYOUTGET4resok {
        bool               logr_return_on_close;
        stateid4           logr_stateid;
        layout4            logr_layout<>;
};

union LAYOUTGET4res switch (nfsstat4 logr_status) {
case NFS4_OK:
        LAYOUTGET4resok     logr_resok4;
case NFS4ERR_LAYOUTTRYLATER:
        bool                logr_will_signal_layout_avail;
default:
        void;
};

