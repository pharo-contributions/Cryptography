encoding
encode: obj withDERStream: derStream

	self error: 'must encode in the scope of a structured container'.
