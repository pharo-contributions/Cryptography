accessing
process
	process == nil ifTrue: [
		self initializeProcessAtPriority: self priority.
	].
	^process