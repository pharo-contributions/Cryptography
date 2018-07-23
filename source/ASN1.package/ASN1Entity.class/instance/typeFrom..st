private
typeFrom: typeSpec

	^ self module
		ifNil: [typeSpec isBehavior
			ifTrue: [typeSpec new]
			ifFalse: [typeSpec]]
		ifNotNil: [self module typeFrom: typeSpec]