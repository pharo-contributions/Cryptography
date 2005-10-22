accessing
userIDString
	userIDString isNil ifTrue: [userIDString := self userIDs first dataAsString].
	^userIDString