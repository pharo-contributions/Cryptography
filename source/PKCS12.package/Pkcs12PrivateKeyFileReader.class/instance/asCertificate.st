accessing
asCertificate

	self certs isEmpty ifTrue: [^ nil].
	^ self certs first
