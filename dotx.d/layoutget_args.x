struct LAYOUTGET4args {
        /* CURRENT_FH: file */
        bool                    loga_signal_layout_avail;
        layouttype4             loga_layout_type;
        layoutiomode4           loga_iomode;
        offset4                 loga_offset;
        length4                 loga_length;
        length4                 loga_minlength;
        stateid4                loga_stateid;
        count4                  loga_maxcount;
};
