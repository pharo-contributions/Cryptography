process
send

	| certVerifyMsg |
	certVerifyMsg := SSLCertificateVerifyMsg new.
	self securityCoord  signClientCertificateVerify:   certVerifyMsg.
	self sendHandshake: certVerifyMsg.
