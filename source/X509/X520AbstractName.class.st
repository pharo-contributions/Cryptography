Class {
	#name : #X520AbstractName,
	#superclass : #Object,
	#instVars : [
		'string'
	],
	#category : 'X509'
}

{ #category : #comparing }
X520AbstractName >> = anotherName [

	^ self string = anotherName string

]

{ #category : #printing }
X520AbstractName >> displayName [

	^ 'A'
]

{ #category : #comparing }
X520AbstractName >> hash [

	^ self string hash

]

{ #category : #printing }
X520AbstractName >> printOn: stream [

	stream nextPutAll: self displayName.
	stream nextPutAll: ' = '.
	self string printOn: stream.

]

{ #category : #accessing }
X520AbstractName >> string [
	"Answer the value of string"

	^ string
]

{ #category : #accessing }
X520AbstractName >> string: anObject [
	"Set the value of string"

	string := anObject
]
