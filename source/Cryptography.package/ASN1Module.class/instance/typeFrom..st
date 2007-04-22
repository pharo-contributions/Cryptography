services
typeFrom: aTypeSpec

	(aTypeSpec isKindOf: ASN1Type) ifTrue: [^ aTypeSpec].
	aTypeSpec isBehavior ifTrue: [^ aTypeSpec new].
	^self find: aTypeSpec