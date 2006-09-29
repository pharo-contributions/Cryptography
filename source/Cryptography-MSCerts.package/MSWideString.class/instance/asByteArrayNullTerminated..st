converting
asByteArrayNullTerminated: aBoolean
	"Convert to a ByteArray with the ascii values of the string."
	| aByteArray |
	aByteArray := (self convertToWithConverter: (UTF16TextConverter new useLittleEndian: true)) asByteArray.
	aBoolean ifTrue: [aByteArray := aByteArray, (ByteArray new: 2)].
	^aByteArray