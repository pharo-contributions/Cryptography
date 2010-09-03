class initialization
shutDown
	super shutDown.
	Picker ifNotNil: 
		[ Picker destroy.
		Picker := nil ]