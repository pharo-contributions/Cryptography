process
processCertificateRequestMsg: msg

	"--jrd - Changed to return true instead of self.  The old behavior was
	causing a MustBeBoolean to be raised when testing to see if the state
	should be transitioned. I have no idea if this is the right place to do this."
	"--Added place where we tell the machine that since we have received a
	client cert request, we have to send a cert. This currently defaults in
	SSLClientSentCertificate to sending an empty cert collection"

	self securityParams requiresClientCertificate: true.
	self machine pushStateClass: SSLClientWaitingForServerHelloDone.
	^true
