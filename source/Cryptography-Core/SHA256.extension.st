Extension { #name : #SHA256 }

{ #category : #'*Cryptography-Core' }
SHA256 class >> isPluginAvailable [

	<primitive: 'primitivePluginAvailable' module: 'SHA256Plugin'>
	^false
]

{ #category : #'*Cryptography-Core' }
SHA256 class >> new [

	self isPluginAvailable 
		ifTrue: [ ^SHA256WithPrimitive basicNew ]
		ifFalse: [ ^SHA256NonPrimitive basicNew ]
]

{ #category : #'*Cryptography-Core' }
SHA256 class >> oidString [

	^ '2.16.840.1.101.3.4.2.2'.

]
