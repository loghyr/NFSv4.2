struct CREATE4resok {
	change_info4	cinfo;
	bitmap4		attrset;	/* attributes set */
};

union CREATE4res switch (nfsstat4 status) {
 case NFS4_OK:
         /* new CURRENTFH: created object */
	 CREATE4resok resok4;
 default:
	 void;
};

