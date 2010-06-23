OAEP encoder
encode: message parameter: parameter length: emLen
	| messageLen paddingString pHash  dataBlock seed dbMask maskedDB seedMask maskedSeed em |

	parameter size > (2 raisedTo: 60) ifTrue: 
		[self error: 'parameter string too long'].
	messageLen _ message size.
	messageLen > (emLen - (2 * hashLen) - 1) ifTrue: 
		[self error: 'message too long'].

	paddingString _ 0 asByteArrayOfSize: (emLen - messageLen - (2*hashLen) - 1).
	pHash _ (hash hashMessage: parameter) asByteArrayOfSize: hashLen.
	dataBlock _ pHash, paddingString, (ByteArray with: 1), message.

	seed _ ByteArray new: hashLen.
	1 to: hashLen do: 
		[:i | seed at: i put: (rand next * 256) floor].
	dbMask _ self maskOfLength: (emLen - hashLen) fromString: seed.
	maskedDB _ dataBlock bitXor: dbMask.
	seedMask _ self maskOfLength: hashLen fromString: maskedDB.
	maskedSeed _ seed bitXor: seedMask.
	em _ maskedSeed, maskedDB.
	^ em