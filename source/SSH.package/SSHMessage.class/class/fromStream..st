instance creation
fromStream: stream

	| class |
	class := SSHMessage messageAtType: stream peek.
	class isNil ifTrue: [^ nil].
	^ class new
		fromStream: stream;
		yourself.
