encoding
encode: anObject withDERStream: derStream owner: owner ownerType: ownerType

	^ self parent
		encode: (anObject perform: self accessor) 
		withDERStream: derStream 
		owner: owner 
		ownerType: ownerType
