class initialization
startUp
	super startUp.
	Picker ifNil: [ Picker _ self withGeneratedKey ]