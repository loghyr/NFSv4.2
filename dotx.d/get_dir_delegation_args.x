
typedef nfstime4 attr_notice4;

struct GET_DIR_DELEGATION4args {
	/* CURRENT_FH: delegated directory */
	bool		gdda_signal_deleg_avail;
        bitmap4		gdda_notification_types;
        attr_notice4	gdda_child_attr_delay;
        attr_notice4	gdda_dir_attr_delay;
        bitmap4		gdda_child_attributes;
        bitmap4		gdda_dir_attributes;
};
