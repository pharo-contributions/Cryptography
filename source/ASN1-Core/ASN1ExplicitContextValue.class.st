Class {
	#name : #ASN1ExplicitContextValue,
	#superclass : #ASN1Value,
	#instVars : [
		'tagIndex',
		'tagValue',
		'tagIsPrimitive'
	],
	#category : #'ASN1-Core-Objects'
}

{ #category : #LICENSE }
ASN1ExplicitContextValue class >> LICENSE [
	"http://www.opensource.org/licenses/mit-license.php"
^'Copyright (c) 2006 Ron Teitelbaum * US Medical Record Specialists * Ron@USMedRec.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'

]

{ #category : #parsing }
ASN1ExplicitContextValue >> asn1Tag [

	^ self tagIsPrimitive
		ifTrue: [128 bitOr: self tagIndex]
		ifFalse: [160 bitOr: self tagIndex].

]

{ #category : #printing }
ASN1ExplicitContextValue >> printOn: aStream [

	aStream nextPutAll:
		'[' , self tagIndex asString , ']' , self tagValue printString
]

{ #category : #accessing }
ASN1ExplicitContextValue >> tagIndex [
	"Answer the value of tagIndex"

	^ tagIndex
]

{ #category : #accessing }
ASN1ExplicitContextValue >> tagIndex: anObject [
	"Set the value of tagIndex"

	tagIndex := anObject
]

{ #category : #accessing }
ASN1ExplicitContextValue >> tagIsPrimitive [
	"Answer the value of tagIsPrimitive"

	^ tagIsPrimitive
]

{ #category : #accessing }
ASN1ExplicitContextValue >> tagIsPrimitive: anObject [
	"Set the value of tagIsPrimitive"

	tagIsPrimitive := anObject
]

{ #category : #accessing }
ASN1ExplicitContextValue >> tagValue [
	"Answer the value of tagValue"

	^ tagValue
]

{ #category : #accessing }
ASN1ExplicitContextValue >> tagValue: anObject [
	"Set the value of tagValue"

	tagValue := anObject
]
