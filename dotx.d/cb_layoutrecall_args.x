/*
 * NFSv4.1 callback arguments and results
 */

enum layoutrecall_type4 {
        LAYOUTRECALL4_FILE = LAYOUT4_RET_REC_FILE,
        LAYOUTRECALL4_FSID = LAYOUT4_RET_REC_FSID,
        LAYOUTRECALL4_ALL  = LAYOUT4_RET_REC_ALL
};

struct layoutrecall_file4 {
        nfs_fh4         lor_fh;
        offset4         lor_offset;
        length4         lor_length;
        stateid4        lor_stateid;
};

union layoutrecall4 switch(layoutrecall_type4 lor_recalltype) {
case LAYOUTRECALL4_FILE:
        layoutrecall_file4 lor_layout;
case LAYOUTRECALL4_FSID:
        fsid4              lor_fsid;
case LAYOUTRECALL4_ALL:
        void;
};

struct CB_LAYOUTRECALL4args {
        layouttype4             clora_type;
        layoutiomode4           clora_iomode;
        bool                    clora_changed;
        layoutrecall4           clora_recall;
};
