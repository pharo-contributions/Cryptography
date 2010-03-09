create
picker
	^ picker ifNil: [ picker := self withGeneratedKey ]