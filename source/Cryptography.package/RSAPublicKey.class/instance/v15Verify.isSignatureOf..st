process
v15Verify: aSignature isSignatureOf: aMessage
	"Answer true if the given signature string signs the given message."

	^ self 
		v15VerifySignature: aSignature 
		ofMessageHash: (
			SHA1 digestInfoAsn1DerEncodingFromMessage: aMessage).
