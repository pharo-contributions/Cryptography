accessing
ssl30Classes

	^ self subclasses select: [:e | e isSSL30Msg]
