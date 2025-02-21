Class {
	#name : #ASN1Module,
	#superclass : #Object,
	#instVars : [
		'name',
		'definitions',
		'imports'
	],
	#classVars : [
		'Modules'
	],
	#category : #'ASN1-Core-Base'
}

{ #category : #'class initialization' }
ASN1Module class >> initialize [

	Modules := Dictionary new

]

{ #category : #accessing }
ASN1Module class >> modules [

	^ Modules
]

{ #category : #'instance creation' }
ASN1Module class >> name: aSymbol [
	"ASN1Module name: #x509"

	| mod |
	^ self modules
		at: aSymbol
		ifAbsent: [
			mod := self new
				name: aSymbol;
				yourself.
			self modules at: mod name put: mod.
			mod]

]

{ #category : #services }
ASN1Module >> add: aType [

	| old |
	old := self definitions at: aType name ifAbsent: [ nil ].
	aType module: self.
	old ifNotNil: [ old becomeForward: aType ].
	^ self definitions at: aType name put: aType
]

{ #category : #accessing }
ASN1Module >> addImport: aModule [

	(self imports includes: aModule) ifFalse: [ 
		self imports add: aModule ]
]

{ #category : #'definitions - mapped' }
ASN1Module >> any: aSymbol [

	^ ASN1AnyType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> any: aSymbol definedBy: slotSymbol [

	^ (ASN1AnyDefinedByType name: aSymbol in: self)
		  definedBy: slotSymbol;
		  yourself
]

{ #category : #'definitions - mapped' }
ASN1Module >> assign: aSymbol from: otherSymbol [

	^ (ASN1AssignmentSubType name: aSymbol in: self)
		  parent: otherSymbol;
		  yourself
]

{ #category : #'definitions - mapped' }
ASN1Module >> bitString: aSymbol [

	^ ASN1BitStringType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> bmpString: aSymbol [

	^ ASN1BMPStringType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> boolean: aSymbol [

	^ ASN1BooleanType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> byteArray: aSymbol [

	^ ASN1ByteArrayType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> choice: aSymbol [

	^ ASN1ChoiceType name: aSymbol in: self
]

{ #category : #accessing }
ASN1Module >> definitions [
	"Answer the value of definitions"

	^ definitions
]

{ #category : #accessing }
ASN1Module >> definitions: anObject [
	"Set the value of definitions"

	definitions := anObject
]

{ #category : #'definitions - mapped' }
ASN1Module >> enumerated: aSymbol [

	^self notYetImplemented

]

{ #category : #'definitions - mapped' }
ASN1Module >> explicit: aSymbol type: type tag: tag [

	^ (ASN1ExplicitSubType name: aSymbol in: self)
		  parent: type;
		  tag: tag;
		  yourself
]

{ #category : #services }
ASN1Module >> find: aSymbol [
	"check the following sources:
		- ASN1Type subclasses
		- my definitions
		- import definitions
	otherwise create a ASN1TypeReference"

	| type |
	type := self primitiveTypeFind: aSymbol.
	type notNil ifTrue: [ ^ type ].
	type := self localFind: aSymbol.
	type notNil ifTrue: [ ^ type ].
	self imports do: [ :eachImportModule | 
		type := eachImportModule localFind: aSymbol.
		type notNil ifTrue: [ ^ type ] ].
	^ ASN1TypeReference name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> ia5String: aSymbol [

	^ ASN1IA5StringType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> implicit: aSymbol type: type tag: tag [

	^ (ASN1ImplicitSubType name: aSymbol in: self)
		  parent: type;
		  tag: tag;
		  yourself
]

{ #category : #accessing }
ASN1Module >> imports [
	"Answer the value of imports"

	^ imports
]

{ #category : #accessing }
ASN1Module >> imports: anObject [
	"Set the value of imports"

	imports := anObject
]

{ #category : #initialization }
ASN1Module >> initialize [

	self definitions: Dictionary new.
	self imports: OrderedCollection new
]

{ #category : #'definitions - mapped' }
ASN1Module >> integer: aSymbol [

	^ASN1IntegerType name: aSymbol in: self
]

{ #category : #services }
ASN1Module >> localFind: aSymbol [

	^ self definitions at: aSymbol ifAbsent: [ ^ nil ]
]

{ #category : #'definitions - mapped' }
ASN1Module >> mapped: aSymbol [

	^ ASN1MappingSubType name: aSymbol in: self

]

{ #category : #accessing }
ASN1Module >> name [

	^ name
]

{ #category : #accessing }
ASN1Module >> name: anObject [
	"Set the value of name"

	name := anObject
]

{ #category : #'definitions - mapped' }
ASN1Module >> null: aSymbol [

	^ ASN1NullType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> objectIdentifier: aSymbol [

	^ ASN1ObjectIdentifierType name: aSymbol in: self
]

{ #category : #services }
ASN1Module >> primitiveTypeFind: aSymbol [

	^ (ASN1Type allSubclasses
		   detect: [ :class | class name asSymbol = aSymbol ]
		   ifNone: [ ^ nil ]) new
]

{ #category : #'definitions - mapped' }
ASN1Module >> printableString: aSymbol [

	^ ASN1PrintableStringType name: aSymbol in: self
]

{ #category : #services }
ASN1Module >> remove: aType [

	self definitions removeKey: aType name.
	aType module: nil.
	^ aType
]

{ #category : #'definitions - mapped' }
ASN1Module >> sequence: aSymbol [

	^ ASN1SequenceType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> sequence: aSymbol mapping: mappingClass [

	^ (ASN1MappedSequenceType name: aSymbol in: self)
		  mapping: mappingClass;
		  yourself
]

{ #category : #'definitions - mapped' }
ASN1Module >> sequence: aSymbol of: typeSpec [

	^ (ASN1SequenceOfType name: aSymbol in: self)
		  elementType: typeSpec;
		  yourself
]

{ #category : #'definitions - mapped' }
ASN1Module >> set: aSymbol [

	^ ASN1SetType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> set: aSymbol mapping: mappingClass [

	^ (ASN1MappedSetType name: aSymbol in: self)
		  mapping: mappingClass;
		  yourself
]

{ #category : #'definitions - mapped' }
ASN1Module >> set: aSymbol of: typeSpec [

	^ (ASN1SetOfType name: aSymbol in: self)
		elementType: typeSpec;
		yourself
]

{ #category : #'definitions - mapped' }
ASN1Module >> teletextString: aSymbol [

	^ ASN1TeletexStringType name: aSymbol in: self
]

{ #category : #services }
ASN1Module >> typeFrom: aTypeSpec [

	(aTypeSpec isKindOf: ASN1Type) ifTrue: [ ^ aTypeSpec ].
	aTypeSpec isBehavior ifTrue: [ ^ aTypeSpec new ].
	^ self find: aTypeSpec
]

{ #category : #'definitions - mapped' }
ASN1Module >> universalString: aSymbol [

	^ ASN1UniversalStringType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> utcTime: aSymbol [

	^ ASN1UTCTimeType name: aSymbol in: self
]

{ #category : #'definitions - mapped' }
ASN1Module >> utf8String: aSymbol [

	^ ASN1StringType name: aSymbol in: self
]
