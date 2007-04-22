process
setupServerCertificateMsg: certMsg forCoord: coord

	| cert |
	cert := coord certificateStore certificateAt: #dsa.
	privateKey := coord certificateStore privateKeyAt: #dsa.
	certMsg certificateList: (OrderedCollection with: cert).
