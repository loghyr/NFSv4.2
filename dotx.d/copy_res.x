
struct copy_requirements4 {
	bool		cr_consecutive;
	bool		cr_synchronous;
};

struct COPY4resok {
	write_response4		cr_response;
	copy_requirements4	cr_requirements;
};

union COPY4res switch (nfsstat4 cr_status) {
case NFS4_OK:
	COPY4resok		cr_resok4;
case NFS4ERR_OFFLOAD_NO_REQS:
	copy_requirements4	cr_requirements;
default:
	void;
};
