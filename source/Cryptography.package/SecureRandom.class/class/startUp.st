class initialization
startUp
	super startUp.
	Picker ifNil: [ Picker := self withGeneratedKey ]