process
setupServerKeyExchange: serverKE forCoord: coord

	| chunk encodedMsg signedMsg |
	super setupServerKeyExchange: serverKE forCoord: coord.
	chunk := coord securityParams clientRandom, coord securityParams serverRandom, serverKE serverParams asByteArray.
	encodedMsg := (MD5 hashMessage: chunk), (SHA1 hashMessage: chunk).
	signedMsg := privateKey v15SignMessageHash: encodedMsg.
	serverKE signature: (signedMsg size asByteArrayOfSize: 2), signedMsg.
