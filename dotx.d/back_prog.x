/*
 * Various definitions for CB_COMPOUND
 */
include(type_nfs_cb_opnum4.x)
include(type_nfs_cb_argop4.x)
include(type_nfs_cb_resop4.x)

include(type_CB_COMPOUND4args.x)
include(type_CB_COMPOUND4res.x)


/*
 * Program number is in the transient range since the client
 * will assign the exact transient program number and provide
 * that to the server via the SETCLIENTID operation.
 */
program NFS4_CALLBACK {
	version NFS_CB {
		void
			CB_NULL(void) = 0;
		CB_COMPOUND4res
			CB_COMPOUND(CB_COMPOUND4args) = 1;
	} = 1;
} = 0x40000000;
