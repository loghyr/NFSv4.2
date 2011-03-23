union deleg_claim4 switch (open_claim_type4 dc_claim) {
/*
 * No special rights to object.  Ordinary delegation
 * request of the specified object.  Object identified
 * by filehandle.
 */
case CLAIM_FH: /* new to v4.1 */
	/* CURRENT_FH: object being delegated */
	void;

/*
 * Right to file based on a delegation granted
 * to a previous boot instance of the client.
 * File is specified by filehandle.
 */
case CLAIM_DELEG_PREV_FH: /* new to v4.1 */
	/* CURRENT_FH: object being delegated */
	void;

/*
 * Right to the file established by an open previous
 * to server reboot.  File identified by filehandle.
 * Used during server reclaim grace period.
 */
case CLAIM_PREVIOUS:
	/* CURRENT_FH: object being reclaimed */
	open_delegation_type4	dc_delegate_type;
};

struct WANT_DELEGATION4args {
	uint32_t	wda_want;
	deleg_claim4	wda_claim;
};

