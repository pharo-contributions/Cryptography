as yet unclassified
encrypt: data

	| plain padding paddedStream paddingLength block encryptedStream encrypted blockCipher |
	plain := data fragment, data mac.
	paddingLength := (8 - (plain size + 1 \\ 8)).
	paddingLength > 0
		ifTrue: [padding := ByteArray new: paddingLength withAll: paddingLength]
		ifFalse: [padding := ByteArray new].
	blockCipher := SSLBlockCipher new 
		content: data fragment; 
		mac: data mac; 
		padding: padding; 
		paddingLength: paddingLength; 
		yourself.

	paddedStream := blockCipher asByteArray readStream.
	encryptedStream := ReadWriteStream on: (ByteArray new: paddedStream size).
	[paddedStream atEnd] whileFalse: 
		[block := paddedStream next: 8.
		des encryptBlock: block.
		encryptedStream nextPutAll: block].
	encrypted := encryptedStream contents.

	^ SSLCiphertext new
		type: data type;
		version: data version;
		length: encrypted size;
		fragment: encrypted;
		yourself