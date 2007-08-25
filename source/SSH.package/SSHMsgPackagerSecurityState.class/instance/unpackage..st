process
unpackage: data

	| msg |
	msg := SSHMessage fromStream: data payload readStream.
	msg isNil ifTrue: [self error: 'bad message'].
	^ msg
