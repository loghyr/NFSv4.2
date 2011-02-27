/*
 * Defines an individual server replica
 */
struct	fs_locations_server4 {
	int32_t		fls_currency;
	opaque		fls_info<>;
	utf8str_cis	fls_server;
};

/*
 * Byte indices of items within
 * fls_info: flag fields, class numbers,
 * bytes indicating ranks and orders.
 */
const FSLI4BX_GFLAGS		= 0;
const FSLI4BX_TFLAGS		= 1;

const FSLI4BX_CLSIMUL		= 2;
const FSLI4BX_CLHANDLE		= 3;
const FSLI4BX_CLFILEID		= 4;
const FSLI4BX_CLWRITEVER	= 5;
const FSLI4BX_CLCHANGE		= 6;
const FSLI4BX_CLREADDIR		= 7;

const FSLI4BX_READRANK		= 8;
const FSLI4BX_WRITERANK		= 9;
const FSLI4BX_READORDER		= 10;
const FSLI4BX_WRITEORDER	= 11;

/*
 * Bits defined within the general flag byte.
 */
const FSLI4GF_WRITABLE		= 0x01;
const FSLI4GF_CUR_REQ		= 0x02;
const FSLI4GF_ABSENT		= 0x04;
const FSLI4GF_GOING		= 0x08;
const FSLI4GF_SPLIT		= 0x10;

/*
 * Bits defined within the transport flag byte.
 */
const FSLI4TF_RDMA		= 0x01;

/*
 * Defines a set of replicas sharing
 * a common value of the root path
 * with in the corresponding
 * single-server namespaces.
 */
struct	fs_locations_item4 {
	fs_locations_server4	fli_entries<>;
	pathname4		fli_rootpath;
};

/*
 * Defines the overall structure of
 * the fs_locations_info attribute.
 */
struct	fs_locations_info4 {
	uint32_t		fli_flags;
        int32_t                 fli_valid_for;
	pathname4		fli_fs_root;
	fs_locations_item4	fli_items<>;
};

/*
 * Flag bits in fli_flags.
 */
const FSLI4IF_VAR_SUB		= 0x00000001;

typedef fs_locations_info4 fattr4_fs_locations_info;
