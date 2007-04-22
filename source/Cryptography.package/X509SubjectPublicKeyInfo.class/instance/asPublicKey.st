accessing
asPublicKey

	self algorithm isDSA ifTrue: [^ self asDSAPublicKey].
	self algorithm isRSA ifTrue: [^ self asRSAPublicKey].
	^ nil