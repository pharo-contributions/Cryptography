process
setupClientKeyExchange: clientKE forCoord: coord

	clientKE exchangeKeys: self preMasterSecretClass new.
	secret := coord generatePreSecret.
	clientKE exchangeKeys preMasterSecret: (publicKey v15Encrypt: self secret).
