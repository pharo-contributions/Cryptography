conversions
nameListOn: collection

	| stream |
	stream := '' writeStream.
	collection 
		do: [:e | stream nextPutAll: e]
		separatedBy: [stream nextPut: $,].
	^ (stream size asByteArrayOfSize: 4), stream contents
