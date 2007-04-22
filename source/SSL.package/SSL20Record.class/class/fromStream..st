as yet unclassified
fromStream: stream

	| record |
	record := self new.
	record length: (stream next bitXor: 128) + stream next.
	record fragment: (stream next: record length).
	^ record
