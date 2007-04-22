as yet unclassified
fromBytes: bytes

	| stream record |
	stream := ReadStream on: bytes.
	record := self new.
	record type: stream next.
	record version: (SSLProtocolVersion major: stream next minor: stream next).
	record length: (stream next: 2) asInteger.
	record fragment: (stream next: record length).
	^ record