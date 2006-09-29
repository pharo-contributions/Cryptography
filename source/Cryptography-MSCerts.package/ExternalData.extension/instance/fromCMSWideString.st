*Cryptography-MSCerts
fromCMSWideString
	"Assume that the receiver represents a C string in utf-16-le format and convert it to a MSWideString"

	| stream index char |
	type isPointerType ifFalse: [self error: 'External object is not a pointer type.'].
	stream := WriteStream on: String new.
	index := 1.
	[index \\ 2 = 1 & (char := handle unsignedCharAt: index) = 0 asCharacter] whileFalse: [
		stream nextPut: char.
		index := index + 1].
	^MSWideString fromString: stream contents