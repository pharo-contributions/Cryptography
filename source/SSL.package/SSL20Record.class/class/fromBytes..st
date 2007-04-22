as yet unclassified
fromBytes: bytes

	| stream record |
	stream := ReadStream on: bytes.
	record := self new.
	record length: (stream next bitXor: 128) + stream next.
	record fragment: (stream next: record length).
	^ record
