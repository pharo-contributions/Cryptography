initialize-release
, bitString

	^ self class new
		bytes: self bytes, bitString bytes;
		bitsPadding: bitString bitsPadding;
		yourself.
