initialize-release
destroy
	self randomChangeProcess terminate.
	self randomChangeProcess: nil.
	self random destroy.
	self data key destroy.
	self data: nil.