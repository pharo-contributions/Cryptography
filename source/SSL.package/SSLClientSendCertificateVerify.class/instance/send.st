process
send

	| certVerifyMsg |
	certVerifyMsg := SSLCertificateVerifyMsg new.
	self sendHandshake: certVerifyMsg.
