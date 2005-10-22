reading
parseData: aStream
	aStream next = 4 ifFalse: [self error: 'Version must be 4'].
	algorithm := aStream next.
	s2kSpecifier := aStream nextS2KSpecifier.
	aStream atEnd ifFalse: [sessionKey := aStream upToEnd]