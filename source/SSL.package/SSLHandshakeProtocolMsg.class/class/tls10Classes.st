accessing
tls10Classes

	^ self subclasses select: [:e | e isTLS10Msg]
