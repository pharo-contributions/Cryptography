process
unpackage: data

	| msg |
	msg := SSHAsciiMessage fromStream: data payload readStream.
	msg isNil ifTrue: [self error: 'bad message'].
	^ msg
