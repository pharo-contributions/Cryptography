converting
fromStream: stream withSecurityParams: securityParams

	securityParams isRSASignatureAlgorithm
		ifTrue: [self signature: (stream next: 36)].
	securityParams isDSASignatureAlgorithm
		ifTrue: [self signature: (stream next: 20)].
