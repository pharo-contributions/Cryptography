decoding
decodeWithDERStream: derStream owner: owner ownerType: ownerType

	| target val |
	target := self mapping new.
	val := self parent
		decodeWithDERStream: derStream 
		owner: owner 
		ownerType: ownerType.
	target perform: self mutator with: val.
	^ target
