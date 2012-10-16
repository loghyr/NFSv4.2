
/*
 * We use data_content4 in case we wish to
 * extend new types later. Note that we
 * are explicitly disallowing data.
 */
union write_plus_arg4 switch (data_content4 content) {
case NFS4_CONTENT_APP_DATA_HOLE:
	app_data_hole4	wpa_adh;
case NFS4_CONTENT_HOLE:
	data_info4	wpa_hole;
default:
	void;
};

struct WRITE_PLUS4args {
	/* CURRENT_FH: file */
	stateid4	wp_stateid;
	stable_how4	wp_stable;
	write_plus_arg4	wp_data<>;
};

