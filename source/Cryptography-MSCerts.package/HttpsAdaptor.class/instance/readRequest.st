processing
readRequest
	
	self cipherSpec ifNil: [
		^HttpRequestHandshake readFromHttpsAdapter: self].
	^HttpRequest readFromStream: self readStream.

