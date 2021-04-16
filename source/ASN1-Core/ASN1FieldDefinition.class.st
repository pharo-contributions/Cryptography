Class {
	#name : #ASN1FieldDefinition,
	#superclass : #ASN1Value,
	#instVars : [
		'fieldName',
		'tagIndex',
		'tagType',
		'explicitFieldDefinition',
		'implicitFieldDefinition',
		'defaultValue',
		'isExplicit',
		'isOptional'
	],
	#category : #'ASN1-Core-DefinitionModel'
}

{ #category : #'instance creation' }
ASN1FieldDefinition class >> forField: aFieldName onDefinition: aDefinitionString [ 
	"Return to the sender an object created from aDefintionString with the
	field name aFieldName"
	| fieldInfo definitionContents noCommentsString |
	
	definitionContents := aDefinitionString copyFrom: (aDefinitionString indexOf: ${)
			+ 1 to: (aDefinitionString indexOf: $})
			- 1.
	noCommentsString := String new.
	definitionContents linesDo: [:aLine |
		((aLine indexOfSubCollection: '--') > 0	or: [aLine withBlanksTrimmed isEmpty])
		ifFalse: [noCommentsString := noCommentsString, aLine].
	].
	fieldInfo := (noCommentsString explode: $,)
		detect: [:aField | aField substrings first = aFieldName] ifNone: [^nil].
	^ self new parseFieldInfo: fieldInfo;
		 yourself
]

{ #category : #testing }
ASN1FieldDefinition class >> testCreate [
	^#('version' 'serialNumber' 'signature' 'issuer' 'validity' 'subject' 'subjectPublicKeyInfo' 'issuerUniqueID' 'subjectUniqueID' 'extensions') collect: [:aField | 
	self forField: aField onDefinition: 'TBSCertificate  ::=  SEQUENCE  {
        version         [0]  EXPLICIT Version DEFAULT v1,
        serialNumber         CertificateSerialNumber,
        signature            AlgorithmIdentifier,
        issuer               Name,
        validity             Validity,
        subject              Name,
        subjectPublicKeyInfo SubjectPublicKeyInfo,
        issuerUniqueID  [1]  IMPLICIT UniqueIdentifier OPTIONAL,
                             -- If present, version shall be v2 or v3
        subjectUniqueID [2]  IMPLICIT UniqueIdentifier OPTIONAL,
                             -- If present, version shall be v2 or v3
        extensions      [3]  EXPLICIT Extensions OPTIONAL
                             -- If present, version shall be v3
        }'].
]

{ #category : #accessing }
ASN1FieldDefinition >> defaultValue [
	"Answer the value of defaultValue"

	^ defaultValue
]

{ #category : #accessing }
ASN1FieldDefinition >> defaultValue: anObject [
	"Set the value of defaultValue"

	defaultValue := anObject
]

{ #category : #accessing }
ASN1FieldDefinition >> explicitFieldDefinition [
	"Answer the value of explicitFieldDefinition"

	^ explicitFieldDefinition
]

{ #category : #accessing }
ASN1FieldDefinition >> explicitFieldDefinition: anObject [
	"Set the value of explicitFieldDefinition"

	explicitFieldDefinition := anObject
]

{ #category : #accessing }
ASN1FieldDefinition >> fieldName [
	"Answer the value of fieldName"

	^ fieldName
]

{ #category : #accessing }
ASN1FieldDefinition >> fieldName: anObject [
	"Set the value of fieldName"

	fieldName := anObject
]

{ #category : #accessing }
ASN1FieldDefinition >> implicitFieldDefinition [
	"Answer the value of implicitFieldDefinition"

	^ implicitFieldDefinition
]

{ #category : #accessing }
ASN1FieldDefinition >> implicitFieldDefinition: anObject [
	"Set the value of implicitFieldDefinition"

	implicitFieldDefinition := anObject
]

{ #category : #accessing }
ASN1FieldDefinition >> isExplicit [
	"Answer the value of isExplicit"

	^ isExplicit
]

{ #category : #accessing }
ASN1FieldDefinition >> isExplicit: anObject [
	"Set the value of isExplicit"

	isExplicit := anObject
]

{ #category : #accessing }
ASN1FieldDefinition >> isOptional [
	"Answer the value of isOptional"

	^ isOptional
]

{ #category : #accessing }
ASN1FieldDefinition >> isOptional: anObject [
	"Set the value of isOptional"

	isOptional := anObject
]

{ #category : #parsing }
ASN1FieldDefinition >> parseFieldInfo: fieldInfo [
	"fill the current instance with fieldInformation"
	| subStrings explodedString noTagIndexString |
	subStrings := fieldInfo substrings.
	self fieldName: subStrings first.
	noTagIndexString :=  (fieldInfo includes: $[) ifTrue: [
		self tagIndex: (fieldInfo copyFrom: (fieldInfo indexOf: $[) + 1 to: (fieldInfo indexOf: $]) - 1).
		(fieldInfo copyFrom:  1 to: (fieldInfo indexOf: $[) -1), (fieldInfo copyFrom: (fieldInfo indexOf: $]) +1 to: fieldInfo size).
	] ifFalse: [
		fieldInfo
	].
	explodedString := noTagIndexString substrings asOrderedCollection.
	(explodedString includes: 'EXPLICIT') ifTrue: [
		explodedString := explodedString remove: 'EXPLICIT'; yourself.
		self isExplicit: true.
	].
	(explodedString includes: 'OPTIONAL') ifTrue: [
		explodedString := explodedString remove: 'OPTIONAL'; yourself.
		self isOptional: true.
	].
	(explodedString includes: 'DEFAULT') ifTrue: [
		explodedString := explodedString remove: 'DEFAULT'; yourself.
		self defaultValue: explodedString last.
		explodedString remove: explodedString last.
	].
	self tagType: explodedString last.
]

{ #category : #accessing }
ASN1FieldDefinition >> tagIndex [
	"Answer the value of tagIndex"

	^ tagIndex
]

{ #category : #accessing }
ASN1FieldDefinition >> tagIndex: anObject [
	"Set the value of tagIndex"

	tagIndex := anObject
]

{ #category : #accessing }
ASN1FieldDefinition >> tagType [
	"Answer the value of tagType"

	^ tagType
]

{ #category : #accessing }
ASN1FieldDefinition >> tagType: anObject [
	"Set the value of tagType"

	tagType := anObject
]
