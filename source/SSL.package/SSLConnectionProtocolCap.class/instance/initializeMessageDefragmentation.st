initialize-release
initializeMessageDefragmentation

	self duplexStack pushUp: MessageDefragmenter new.
	self duplexStack pushDown: MessageFragmenter new.
