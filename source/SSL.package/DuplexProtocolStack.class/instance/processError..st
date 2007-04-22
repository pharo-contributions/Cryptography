protocol
processError: ex

	(ex isKindOf: SSLError)
		ifTrue: [^ self topCap processStackError: ex].
