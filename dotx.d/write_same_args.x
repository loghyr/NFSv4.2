
struct WRITE_SAME4args {
	/* CURRENT_FH: file */
	stateid4	wsa_stateid;
	stable_how4	wsa_stable;
	app_data_block4	wsa_adb;
};

