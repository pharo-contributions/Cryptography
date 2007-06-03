accessing
attachmentsText

	| stream |
	stream := '' writeStream.
	self attachments do: [:e | 
		stream nextPutAll: e; nextPutAll: '; '].
	^ stream contents