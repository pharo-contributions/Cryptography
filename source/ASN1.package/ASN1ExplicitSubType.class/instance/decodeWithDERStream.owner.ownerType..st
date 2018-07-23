decoding
decodeWithDERStream: derStream owner: owner ownerType: ownerType

	derStream nextTag.
	derStream nextLength.
	^ self parent decodeWithDERStream: derStream owner: owner ownerType: ownerType.
