as yet unclassified
page

	| stream |
	stream := '' writeStream.
	path do: [ :pathElem |
		stream nextPut: $/.
		stream nextPutAll: pathElem encodeForHTTP. ].
	self query isNil ifFalse: [ 
		stream nextPut: $?.
		stream nextPutAll: self query. ].
	^ stream contents.