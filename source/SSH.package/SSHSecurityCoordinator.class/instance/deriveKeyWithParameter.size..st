key derivation
deriveKeyWithParameter: param size: size

	| hashClass iterations sourceKey sourceHash sourceData key |
	hashClass := self keyExchangeProcessor hashClass.
	iterations := (size + hashClass hashSize - 1) // hashClass hashSize.
	sourceKey := SSHBinaryMessage new mpintOn: self securityParams secretKey.
	sourceHash := self securityParams exchangeHash.
	sourceData := param asString asByteArray, self securityParams sessionIdentifier.
	key := #() asByteArray.
	iterations timesRepeat: [
		key := key, (hashClass hashMessage: (sourceKey, sourceHash, sourceData)).
		sourceData := key].
	^ key copyFrom: 1 to: size