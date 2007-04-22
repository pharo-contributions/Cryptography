encoding
encode: anObject withType: type

	type encode: anObject withDERStream: self.
	^ self contents
