union layoutreturn_stateid switch (bool lrs_present) {
case TRUE:
        stateid4                lrs_stateid;
case FALSE:
        void;
};

union LAYOUTRETURN4res switch (nfsstat4 lorr_status) {
case NFS4_OK:
        layoutreturn_stateid    lorr_stateid;
default:
        void;
};

