process
unpackage: data

	| msg |
	msg := SSHAsciiMessage fromStream: data readStream.
	msg isNil ifTrue: [self error: 'bad message'].
	^ msg
