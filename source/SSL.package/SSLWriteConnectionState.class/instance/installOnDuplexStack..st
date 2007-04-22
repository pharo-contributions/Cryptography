control
installOnDuplexStack: stack

	| list proto |
	list := OrderedCollection new.
	[
		list add: (proto := stack popDown).
		proto isMsgFragmenter] 
			whileFalse.
	proto writeState: self.
	stack pushDown: self cipherState encryptor.
	stack pushDown: self macState macGenerator.
	stack pushDown: self compressionState compressor.
	[list isEmpty] whileFalse: [stack pushDown: list removeLast]
