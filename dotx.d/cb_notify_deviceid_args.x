/*
 * Device notification types.
 */
enum notify_deviceid_type4 {
	NOTIFY_DEVICEID4_CHANGE = 1,
	NOTIFY_DEVICEID4_DELETE = 2
};

/* For NOTIFY4_DEVICEID4_DELETE */
struct notify_deviceid_delete4 {
	layouttype4	ndd_layouttype;
	deviceid4	ndd_deviceid;
};

/* For NOTIFY4_DEVICEID4_CHANGE */
struct notify_deviceid_change4 {
	layouttype4	ndc_layouttype;
	deviceid4	ndc_deviceid;
	bool		ndc_immediate;
};

struct CB_NOTIFY_DEVICEID4args {
	notify4	cnda_changes<>;
};

