comparing
< protocolVersion

	self major < protocolVersion major
		ifTrue: [^true].
	self major = protocolVersion major
		ifTrue: [^self minor < protocolVersion minor].
	^ false