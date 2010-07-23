translation
declareCVarsIn: cg

	super declareCVarsIn: cg.
	cg var: #byteBit type: #'unsigned int *'.
	cg var: #bigByte type: #'unsigned int *'.
	cg var: #pc1 type: #'unsigned int *'.
	cg var: #pc2 type: #'unsigned int *'.
	cg var: #totRot type: #'unsigned int *'.
	cg var: #sp1 type: #'unsigned int *'.
	cg var: #sp2 type: #'unsigned int *'.
	cg var: #sp3 type: #'unsigned int *'.
	cg var: #sp4 type: #'unsigned int *'.
	cg var: #sp5 type: #'unsigned int *'.
	cg var: #sp6 type: #'unsigned int *'.
	cg var: #sp7 type: #'unsigned int *'.
	cg var: #sp8 type: #'unsigned int *'.
