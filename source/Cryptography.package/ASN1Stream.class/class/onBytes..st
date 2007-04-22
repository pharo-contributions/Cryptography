instance creation
onBytes: bytes

	^ self onStream: bytes readStream.
