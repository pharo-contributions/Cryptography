class initialization
shutDown
	super shutDown.
	self allInstances do: [:a | a shutDown].