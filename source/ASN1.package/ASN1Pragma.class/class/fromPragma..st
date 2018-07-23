instance creation
fromPragma: aPragma
	| aClass |
	aClass := (self isAccessorPragma: aPragma) ifTrue: [ASN1PragmaAccessor] ifFalse: [ASN1PragmaMutator].
	^aClass fromPragma: aPragma