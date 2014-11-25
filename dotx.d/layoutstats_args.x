
struct LAYOUTSTATS4args {
        /* CURRENT_FH: file */
        offset4                 lsa_offset;
        length4                 lsa_length;
        stateid4                lsa_stateid;
        io_info4                lsa_read;
        io_info4                lsa_write;
        deviceid4               lsa_deviceid;
        layoutupdate4           lsa_layoutupdate;
};
