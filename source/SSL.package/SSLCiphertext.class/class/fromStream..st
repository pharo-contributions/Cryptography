as yet unclassified
fromStream: stream

	| record |
	record := self new.
	record type: stream next.
	record version: (SSLProtocolVersion major: stream next minor: stream next).
	record length: (stream next: 2) asInteger.
	record fragment: (stream next: record length).
	^ record