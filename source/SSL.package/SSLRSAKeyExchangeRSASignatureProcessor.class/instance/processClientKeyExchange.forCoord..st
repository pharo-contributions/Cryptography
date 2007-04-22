process
processClientKeyExchange: clientKE forCoord: coord

	| exchange protocolVersion |
	exchange := clientKE exchangeKeys.
	secret := (privateKey v15Decrypt: exchange preMasterSecret asInteger) asByteArray.
	protocolVersion := SSLProtocolVersion major: (secret at: 1) minor: (secret at: 2).
	coord securityParams originalVersion = protocolVersion
		ifFalse: [secret := coord generatePreSecret].