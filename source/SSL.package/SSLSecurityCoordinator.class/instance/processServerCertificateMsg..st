certificates
processServerCertificateMsg: certMsg

	(self validateCertificateChain: certMsg certificateList)
		ifFalse: [
			self sendAlertCode: 42.
			^ self
		].
	self keyExchangeProcessor processServerCertificateMsg: certMsg forCoord: self.
