
struct WRITE_SAME4args {
	/* CURRENT_FH: file */
	stateid4	ws_stateid;
	stable_how4	ws_stable;
	app_data_hole4	ws_adh;
};

