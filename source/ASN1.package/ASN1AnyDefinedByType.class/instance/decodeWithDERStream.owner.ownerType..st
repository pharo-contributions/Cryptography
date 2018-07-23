decoding
decodeWithDERStream: derStream owner: owner ownerType: ownerType

	| keyValue type |
	keyValue := (ownerType elementWithSymbol: self definedBy)
		valueFrom: owner.
	type := self at: keyValue.
	^ type decodeWithDERStream: derStream.
