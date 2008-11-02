process
processCertificateRequestMsg: msg

	"--jrd - Changed to return true instead of self.  The old behavior was
	causing a MustBeBoolean to be raised when testing to see if the state
	should be transitioned. I have no idea if this is the right place to do this."

	self machine pushStateClass: SSLClientWaitingForServerHelloDone.
	^true
