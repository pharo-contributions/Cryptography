conversions
stringOn: string

	| stream |
	stream := #() asByteArray writeStream.
	stream nextPutAll: (string size asByteArrayOfSize: 4).
	stream nextPutAll: string asByteArray.
	^ stream contents