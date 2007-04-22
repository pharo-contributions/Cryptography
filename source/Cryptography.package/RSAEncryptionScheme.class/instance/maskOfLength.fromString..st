mask generator
maskOfLength: numberOfBytes fromString: seedString
	| t c |
	numberOfBytes > ((2 raisedTo: 32) * hashLen) ifTrue: 
		[self error: 'mask too long'].
	t _ ByteArray new.
	0 to: (numberOfBytes / hashLen) floor do: [:counter |
		c _ counter asByteArrayOfSize: 4.
		t _ t, ((hash hashMessage: seedString, c) asByteArrayOfSize: hashLen)].
	^ t copyFrom: 1 to: numberOfBytes
