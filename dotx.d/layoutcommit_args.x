union newtime4 switch (bool nt_timechanged) {
case TRUE:
        nfstime4           nt_time;
case FALSE:
        void;
};

union newoffset4 switch (bool no_newoffset) {
case TRUE:
        offset4           no_offset;
case FALSE:
        void;
};

struct LAYOUTCOMMIT4args {
        /* CURRENT_FH: file */
        offset4                 loca_offset;
        length4                 loca_length;
        bool                    loca_reclaim;
        stateid4                loca_stateid;
        newoffset4              loca_last_write_offset;
        newtime4                loca_time_modify;
        layoutupdate4           loca_layoutupdate;
};
