instance creation
fromBytes: bytes

	| stream |
	stream := ReadStream on: bytes.
	^ self fromStream: stream.

