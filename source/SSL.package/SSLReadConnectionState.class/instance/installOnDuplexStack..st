control
installOnDuplexStack: stack

	| list proto |
	list := OrderedCollection new.
	[
		list add: (proto := stack popUp).
		proto isMsgDefragmenter] 
			whileFalse.
	proto readState: self.
	stack pushUp: self cipherState decryptor.
	stack pushUp: self macState macVerifier.
	stack pushUp: self compressionState decompressor.
	[list isEmpty] whileFalse: [stack pushUp: list removeLast]
