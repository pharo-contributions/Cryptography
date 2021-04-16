Class {
	#name : #ASN1Pragma,
	#superclass : #Object,
	#instVars : [
		'pragma',
		'asn1name',
		'systemClass',
		'method'
	],
	#category : #'ASN1-Core-DefinitionModel'
}

{ #category : #LICENSE }
ASN1Pragma class >> LICENSE [
	"http://www.opensource.org/licenses/mit-license.php"
^'Copyright (c) 2006 Ron Teitelbaum * US Medical Record Specialists * Ron@USMedRec.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'

]

{ #category : #'instance creation' }
ASN1Pragma class >> fromPragma: aPragma [
	| aClass |
	aClass := (self isAccessorPragma: aPragma) ifTrue: [ASN1PragmaAccessor] ifFalse: [ASN1PragmaMutator].
	^aClass fromPragma: aPragma
]

{ #category : #'instance creation' }
ASN1Pragma class >> isAccessorPragma: aPragma [
	^aPragma keyword = #asn1FieldAccessor:
]

{ #category : #accessing }
ASN1Pragma >> asn1name [
	"Answer the value of asn1name"

	^ asn1name
]

{ #category : #accessing }
ASN1Pragma >> asn1name: anObject [
	"Set the value of asn1name"

	asn1name := anObject
]

{ #category : #accessing }
ASN1Pragma >> method [
	"Answer the value of method"

	^ method
]

{ #category : #accessing }
ASN1Pragma >> method: anObject [
	"Set the value of method"

	method := anObject
]

{ #category : #accessing }
ASN1Pragma >> pragma [
	"Answer the value of pragma"

	^ pragma
]

{ #category : #accessing }
ASN1Pragma >> pragma: anObject [
	"Set the value of pragma"

	pragma := anObject
]

{ #category : #accessing }
ASN1Pragma >> systemClass [
	"Answer the value of systemClass"

	^ systemClass
]

{ #category : #accessing }
ASN1Pragma >> systemClass: anObject [
	"Set the value of systemClass"

	systemClass := anObject
]
