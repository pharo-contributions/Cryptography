printing
printOn: aStream
	aStream nextPutAll: (self class name asString, ' port: ', self portNumber asString).
	self isRunning ifTrue: [
		aStream nextPutAll: ' [running]'
	] ifFalse:[
		aStream nextPutAll: ' [stopped]'
	]