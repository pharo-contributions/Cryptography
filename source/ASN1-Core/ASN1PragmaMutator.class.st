Class {
	#name : #ASN1PragmaMutator,
	#superclass : #ASN1Pragma,
	#instVars : [
		'classOfMutatorArgument'
	],
	#category : #'ASN1-Core-DefinitionModel'
}

{ #category : #LICENSE }
ASN1PragmaMutator class >> LICENSE [
	"http://www.opensource.org/licenses/mit-license.php"
^'Copyright (c) 2006 Ron Teitelbaum * US Medical Record Specialists * Ron@USMedRec.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'

]

{ #category : #'instance creation' }
ASN1PragmaMutator class >> fromPragma: aPragma [
	^self new
		pragma: aPragma;
		asn1name: aPragma arguments first;
		method: aPragma method methodReference methodSymbol;
		systemClass: aPragma method methodReference classSymbol;
		classOfMutatorArgument: aPragma arguments second;
		yourself
]

{ #category : #accessing }
ASN1PragmaMutator >> classOfMutatorArgument [
	"Answer the value of classOfMutatorArgument"

	^ classOfMutatorArgument
]

{ #category : #accessing }
ASN1PragmaMutator >> classOfMutatorArgument: anObject [
	"Set the value of classOfMutatorArgument"

	classOfMutatorArgument := anObject
]

{ #category : #printing }
ASN1PragmaMutator >> printOn: aWS [
	| classString article |
	classString := self classOfMutatorArgument asString.
	article := classString first isVowel ifTrue: [' an '] ifFalse: [' a '].
	aWS nextPutAll: self asn1name asString, String tab, self systemClass asString, '>>', self method asString, article, classString.
]
