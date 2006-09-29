instance creation
createFromStream: aStream
	| message aHello versionID helloVersion |
	self halt.
	versionID _ aStream next.
	helloVersion _ self nameFromVersionID: versionID.
	message := self getRawDataFrom: aStream forVersion: helloVersion.
	aHello _ self new rawData: message.
	aHello parseMessageForVersion: helloVersion.
	^aHello 