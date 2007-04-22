as yet unclassified
send

	| certMsg |
	certMsg := SSLCertificateMsg new.
	self securityCoord setupServerCertificateMsg: certMsg.
	self sendHandshake: certMsg.
