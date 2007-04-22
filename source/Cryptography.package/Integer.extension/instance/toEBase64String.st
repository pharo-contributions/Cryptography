*cryptography-core
toEBase64String

	self < 0 ifTrue: [^ '-', self negated toEBase64String].
	^ self asByteArray toEBase64String.
