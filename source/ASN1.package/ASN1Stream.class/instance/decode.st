decoding
decode

	| tag numericTag type tagClass isConstructed |
	tag := self peekTag.
	numericTag := tag bitAnd: 2r00011111.
	tagClass := tag bitAnd: 2r11000000.
	isConstructed := (tag bitAnd: 2r00100000) > 0.
	tagClass > 0
		ifTrue: [isConstructed
			ifTrue: [type := ASN1WrapperConstructedType new]
			ifFalse: [type := ASN1WrapperPrimitiveType new]]
		ifFalse: [type := self class tagToTypeDispatchTable at: numericTag].
	^ self decodeWithType: type.
