processing
parseMessageForVersion: helloVersion
	| |
	helloVersion = self class ssl20constant ifTrue: [^self parseVersion2Hello].
	helloVersion = self class ssl30constant ifTrue: [^self parseVersion3Hello].