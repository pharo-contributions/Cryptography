reading/writing
readStoreData

	| refStream |
	refStream := ReferenceStream fileNamed: self certStoreFilename.
	self storeData: refStream next.
	refStream close.

