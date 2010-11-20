/*
 * Operation arrays
 */

include(type_nfs_opnum4.x)
include(type_nfs_argop4.x)
include(type_nfs_resop4.x)
include(type_COMPOUND4args.x)
include(type_COMPOUND4res.x)

/*
 * Remote file service routines
 */
program NFS4_PROGRAM {
	version NFS_V4 {
		void
			NFSPROC4_NULL(void) = 0;

		COMPOUND4res
			NFSPROC4_COMPOUND(COMPOUND4args) = 1;

	} = 4;
} = 100003;

/*
 * NFS4 Callback Procedure Definitions and Program
 */
