accessing
fingerprint
	fingerprint = nil ifTrue: [fingerprint := self computeFingerprint].
	^fingerprint