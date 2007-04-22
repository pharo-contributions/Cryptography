create
picker
	^ picker ifNil: [ picker _ self withGeneratedKey ]