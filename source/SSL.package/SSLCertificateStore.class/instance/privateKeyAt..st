api
privateKeyAt: name

	^ self privateKeys at: name ifAbsent: [nil].
