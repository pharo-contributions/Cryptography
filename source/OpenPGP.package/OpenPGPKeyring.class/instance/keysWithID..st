accessing
keysWithID: aKeyID
	^entries select: [:each | each packets first keyID = aKeyID]