accessing
asPrivateKey

	self privateKeys isEmpty ifTrue: [^ nil].
	^ self privateKeys first