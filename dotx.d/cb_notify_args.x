/*
 * Directory notification types.
 */
enum notify_type4 {
	NOTIFY4_CHANGE_CHILD_ATTRS = 0,
	NOTIFY4_CHANGE_DIR_ATTRS = 1,
	NOTIFY4_REMOVE_ENTRY = 2,
	NOTIFY4_ADD_ENTRY = 3,
	NOTIFY4_RENAME_ENTRY = 4,
	NOTIFY4_CHANGE_COOKIE_VERIFIER = 5
};

/* Changed entry information.  */
struct notify_entry4 {
	component4	ne_file;
	fattr4		ne_attrs;
};

/* Previous entry information */
struct prev_entry4 {
	notify_entry4	pe_prev_entry;
	/* what READDIR returned for this entry */
	nfs_cookie4	pe_prev_entry_cookie;
};

struct notify_remove4 {
	notify_entry4	nrm_old_entry;
	nfs_cookie4	nrm_old_entry_cookie;
};

struct notify_add4 {
        /*
         * Information on object
         * possibly renamed over.
         */
	notify_remove4	    nad_old_entry<1>;
	notify_entry4	    nad_new_entry;
	/* what READDIR would have returned for this entry */
	nfs_cookie4	    nad_new_entry_cookie<1>;
	prev_entry4	    nad_prev_entry<1>;
	bool		    nad_last_entry;
};

struct notify_attr4 {
	notify_entry4	na_changed_entry;
};

struct notify_rename4 {
	notify_remove4	nrn_old_entry;
	notify_add4	nrn_new_entry;
};

struct notify_verifier4 {
	verifier4	nv_old_cookieverf;
	verifier4	nv_new_cookieverf;
};

/*
 * Objects of type notify_<>4 and
 * notify_device_<>4 are encoded in this.
 */
typedef opaque notifylist4<>;

struct notify4 {
	/* composed from notify_type4 or notify_deviceid_type4 */
        bitmap4         notify_mask;
        notifylist4     notify_vals;
};

struct CB_NOTIFY4args {
	stateid4    cna_stateid;
        nfs_fh4     cna_fh;
	notify4	    cna_changes<>;
};

