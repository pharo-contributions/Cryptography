instance creation
parseExtensionsFrom: aByteArrayStream for: tlsHello
	| extensionStream extensions aType anExtension |
	extensionStream _ (aByteArrayStream next: (aByteArrayStream next: 2) asInteger) readStream.
	extensions _ OrderedCollection new.
	[extensionStream atEnd] whileFalse: [
	anExtension := (self classForType: (aType _ (extensionStream next: 2) asInteger)) 
		parseFromStream: extensionStream.
	anExtension tlsHello: tlsHello.
	extensions add: anExtension.
	].
	^extensions
			