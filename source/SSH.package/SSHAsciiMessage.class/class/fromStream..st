instance creation
fromStream: stream

	| label |
	label := stream next: 3.
	stream position: stream position - 3.
	^ label = 'SSH'
		ifTrue: [SSHIdentificationMessage new
			identification: stream upToEnd;
			yourself]
		ifFalse: [SSHBannerMessage new
			banner: stream upToEnd;
			yourself].
