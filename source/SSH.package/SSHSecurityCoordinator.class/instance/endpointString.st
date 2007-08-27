accessing
endpointString

	self isClient isNil ifTrue: [^ 'Unknown'].
	^ self isClient
		ifTrue: ['Client']
		ifFalse: ['Server']