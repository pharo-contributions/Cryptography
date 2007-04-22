encoding
encode: anObject withDERStream: derStream

	^ self parent
		encode: (anObject perform: self accessor)
		withDERStream: derStream 
