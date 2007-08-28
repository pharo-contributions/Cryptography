process
decodeSignature

	| stream id blob r s |
	stream := self signature asByteArray readStream.
	id := (stream next: (stream next: 4) asInteger) asString.
	id = 'ssh-dss'
		ifTrue: [
			blob := (self fromStringOnStream: stream) asByteArray.
			r := blob copyFrom: 1 to: 20.
			s := blob copyFrom: 21 to: 40.
			^ self signature: (Array with: r asInteger with: s asInteger)].
	id = 'ssh-rsa'
		ifTrue: [
			blob := (self fromStringOnStream: stream) asByteArray.
			^ self signature: blob asInteger].
