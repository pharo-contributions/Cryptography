Class {
	#name : #X520Attribute,
	#superclass : #Object,
	#instVars : [
		'attrOid',
		'attrValue'
	],
	#category : 'X509'
}

{ #category : #comparing }
X520Attribute >> = attr [

	^ self attrOid = attr attrOid
		and: [self attrValue = attr attrValue]
]

{ #category : #accessing }
X520Attribute >> attrOid [
	"Answer the value of attrOid"

	^ attrOid
]

{ #category : #accessing }
X520Attribute >> attrOid: anObject [
	"Set the value of attrOid"

	attrOid := anObject
]

{ #category : #accessing }
X520Attribute >> attrValue [
	"Answer the value of attrValue"

	^ attrValue
]

{ #category : #accessing }
X520Attribute >> attrValue: anObject [
	"Set the value of attrValue"

	attrValue := anObject
]

{ #category : #comparing }
X520Attribute >> hash [

	^ self attrOid hash + self attrValue hash
]

{ #category : #'initialize-release' }
X520Attribute >> printOn: stream [

	stream nextPutAll: self attrValue asString.

]

{ #category : #accessing }
X520Attribute >> shortName [

	^ 'Attribute-', self attrOid oid
]
