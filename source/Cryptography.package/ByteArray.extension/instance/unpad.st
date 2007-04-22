*cryptography-core
unpad
	| pad end |
	self isProperlyPadded ifFalse: [ CryptographyError signal: 'Authentication failure (improperly padded!)' ].
	pad _ self last.
	end _ self size - pad.
	^ self copyFrom: 1 to: end