accessing
encrypt: aByteArray 
	"Answer a copy of aByteArray which is encrypted with my key."
	| encryptable |
	encryptable := self isStreamCipher
		ifTrue: [ aByteArray copy ]
		ifFalse: [ aByteArray padToMultipleOf: self blockSize ].
	^ self 
		encrypt: encryptable
		from: 1
		to: encryptable size