instance creation
new

	^ self onStream: (ByteArray new: 100) writeStream.
