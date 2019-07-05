"
This class is used to parse an asn1Definition of a class.  

Use the prama syntax to define the asn1 encoding
    <ans1Definition: 'put definition here'>

for example:
	<asn1Definition: 'CertificateList  ::=  SEQUENCE  {
        tbsCertList          TBSCertList,
        signatureAlgorithm   AlgorithmIdentifier,
        signatureValue       BIT STRING  }'>
"
Class {
	#name : #ASN1DefinitionModel,
	#superclass : #Object,
	#instVars : [
		'subject',
		'asn1ClassName',
		'asn1DefinitionString',
		'fields',
		'resultObject',
		'currentObject',
		'currentField',
		'currentMutator',
		'currentAccessor',
		'fieldStack'
	],
	#category : 'ASN1-DefinitionModel'
}

{ #category : #LICENSE }
ASN1DefinitionModel class >> LICENSE [
	"http://www.opensource.org/licenses/mit-license.php"
^'Copyright (c) 2006 Ron Teitelbaum * US Medical Record Specialists * Ron@USMedRec.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'

]

{ #category : #'instance creation' }
ASN1DefinitionModel class >> on: aClassWithASN1Definitions [
	
	^self new
		subject: aClassWithASN1Definitions;
		yourself.
]

{ #category : #accessing }
ASN1DefinitionModel >> asn1ClassName [
	"Answer the value of asn1ClassName"

	^ asn1ClassName ifNil: [asn1ClassName := self parseASN1ClassName. asn1ClassName]
]

{ #category : #accessing }
ASN1DefinitionModel >> asn1ClassName: anObject [
	"Set the value of asn1ClassName"

	asn1ClassName := anObject
]

{ #category : #accessing }
ASN1DefinitionModel >> asn1DefinitionString [
	"Answer the value of asn1DefinitionString"

	^ asn1DefinitionString ifNil: [asn1DefinitionString := self parseASN1DefinitionString. asn1DefinitionString]
]

{ #category : #accessing }
ASN1DefinitionModel >> asn1DefinitionString: anObject [
	"Set the value of asn1DefinitionString"

	asn1DefinitionString := anObject
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> createObjectsAndPushFields [
	self resultObject ifNil: 
		[self setRootObject].
	self currentObject ifNil: 
		[self setCurrentObject].
	self currentField isNil 
		ifTrue: [self setCurrentField]
		ifFalse: [self pushNextField].
	self setCurrentMutator.
	
]

{ #category : #accessing }
ASN1DefinitionModel >> currentAccessor [
	"Answer the value of currentAccessor"

	^ currentAccessor
]

{ #category : #accessing }
ASN1DefinitionModel >> currentAccessor: anObject [
	"Set the value of currentAccessor"

	currentAccessor := anObject
]

{ #category : #accessing }
ASN1DefinitionModel >> currentField [
	"Answer the value of currentField"

	^ currentField
]

{ #category : #accessing }
ASN1DefinitionModel >> currentField: anObject [
	"Set the value of currentField"

	currentField := anObject
]

{ #category : #accessing }
ASN1DefinitionModel >> currentMutator [
	"Answer the value of currentMutator"

	^ currentMutator
]

{ #category : #accessing }
ASN1DefinitionModel >> currentMutator: anObject [
	"Set the value of currentMutator"

	currentMutator := anObject
]

{ #category : #accessing }
ASN1DefinitionModel >> currentObject [
	"Answer the value of currentObject"

	^ currentObject
]

{ #category : #accessing }
ASN1DefinitionModel >> currentObject: anObject [
	"Set the value of currentObject"

	currentObject := anObject
]

{ #category : #accessing }
ASN1DefinitionModel >> fieldStack [
	"Answer the value of fieldStack"

	^ fieldStack ifNil: [fieldStack := Stack new].
]

{ #category : #accessing }
ASN1DefinitionModel >> fieldStack: anObject [
	"Set the value of fieldStack"

	fieldStack := anObject
]

{ #category : #accessing }
ASN1DefinitionModel >> fields [
	"Answer the value of fields"

	^ fields ifNil: [fields := self parseFieldNames. fields].
]

{ #category : #accessing }
ASN1DefinitionModel >> fields: anObject [
	"Set the value of fields"

	fields := anObject
]

{ #category : #'services pragma' }
ASN1DefinitionModel >> getPragmaAccessors [
	"return the pragmas defined on this class.  These values are usually put in the accessor of the ivar, but could be in other regular methods if it is appropriate.  The form of the pragma is <asn1FieldAccessor: 'put the name of the field from the left hand side of the asn1Definition here'>.  
	for example if you have an ivar named: #title that has a definition 
		MyASN1Object ::= Sequence {
			asn1Title	DisplayableString
		}
		then the accessor for title should look like this:
		title
			
			<asn1FieldAccessor: 'asn1Title'>
			^title
		
	Every field definition in the asn1Defintion string must have a corresponding pragma"
	
	^(Pragma allNamed: #asn1FieldAccessor: in: self subject) collect: [:aPragma | ASN1PragmaAccessor fromPragma: aPragma].
]

{ #category : #'services pragma' }
ASN1DefinitionModel >> getPragmaMutators [
	"return the pragmas defined on this class.  These values are usually put in the mutator of the ivar, but could be in other regular methods if it is appropriate.  The form of the pragma is <asn1FieldMutator: 'put the name of the field from the right hand side of the asn1Definition here' class: #ClassOfMutatorArgument>.    Use symbol for class because of monticello loading problems.
	for example if you have an ivar named: #title that has a definition 
		MyASN1Object ::= Sequence {
			asn1Title	DisplayableString
		}
		then the mutaotr for title should look like this:
		title: aTitle
			
			<asn1FieldMutator: 'asn1Title' class: #String>
			title := aTitle.
		
	Every field definition in the asn1Defintion string must have a corresponding pragma"
	
	^(Pragma allNamed: #asn1FieldMutator:class: in: self subject) collect: [:aPragma | ASN1PragmaMutator fromPragma: aPragma].
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> parseASN1ClassName [
	"return the ans1definition argument string"
	| aDefString classSepIndex |
	aDefString := self asn1DefinitionString ifNil: [^nil].
	classSepIndex := aDefString indexOfSubCollection: '::='.
	classSepIndex = 0 ifTrue: [^nil].
	^(aDefString copyFrom: 1 to: classSepIndex - 1) withBlanksTrimmed.
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> parseASN1DefinitionString [
	"return the ans1definition argument string"
	| aPragma aCollection |
	aCollection := Pragma allNamed: #asn1Definition: in: self subject class.
	^ aCollection isEmpty
		ifFalse: [aPragma := aCollection first.
			aPragma arguments
				at: 1
				ifAbsent: []]
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> parseFieldNames [
	| aString fields |
	aString := self asn1DefinitionString.
	fields := OrderedCollection new.
	(aString copyFrom: (aString indexOf: ${) + 1 to: (aString indexOf: $}) - 1) linesDo: [:aLine |
		(((aLine indexOfSubCollection: '--') > 0) or: [aLine withBlanksTrimmed isEmpty])ifFalse: [
			fields add: aLine subStrings first
		].
	].
	^fields
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> parseRootObjectType [
	"parse the definition string and figure out if this object is a subject or a
	collection of subjects"
	| aString aType |
	aString := self asn1DefinitionString.
	aType := (aString copyFrom: (aString indexOfSubCollection: '::=')
					+ 4 to: (aString indexOf: ${)
					- 1) withBlanksTrimmed.
	^aType isEmpty
		ifTrue: [self subject]
		ifFalse: [aType = 'SEQUENCE'
				ifTrue: [OrderedCollection]
				ifFalse: [self error: 'new root type']]
]

{ #category : #accessing }
ASN1DefinitionModel >> resultObject [
	"Answer the value of resultObject"

	^ resultObject
]

{ #category : #accessing }
ASN1DefinitionModel >> resultObject: anObject [
	"Set the value of resultObject"

	resultObject := anObject
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> setCurrentObject [
	self currentObject: self subject new.
]

{ #category : #'services parsing' }
ASN1DefinitionModel >> setRootObject [
	self resultObject: self parseRootObjectType new.
	self resultObject isCollection
		ifTrue: [self currentObject: self subject new]
		ifFalse: [self currentObject: self resultObject]
]

{ #category : #accessing }
ASN1DefinitionModel >> subject [
	"Answer the value of subject"

	^ subject
]

{ #category : #accessing }
ASN1DefinitionModel >> subject: anObject [
	"Set the value of subject"

	subject := anObject
]

{ #category : #'services verifying' }
ASN1DefinitionModel >> verifyFieldAccessorsAndMutators [
	"check to see that the ans1 definition is represented by all the appropriate accessor and mutator definitions"
	| myAccessors myMutators |
	myAccessors := self getPragmaAccessors.
	myMutators := self getPragmaMutators.
	^self parseFieldNames allSatisfy: [:aField |
		(myAccessors anySatisfy: [:anAccessor | anAccessor asn1name = aField]) and: [
			(myMutators anySatisfy: [:aMutator | aMutator asn1name = aField])]].
		
]
