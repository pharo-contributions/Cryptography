as yet unclassified
send

	| certMsg |
	certMsg := SSLCertificateMsg new.
	self securityCoord setupClientCertificateMsg: certMsg.
	self sendHandshake: certMsg.
