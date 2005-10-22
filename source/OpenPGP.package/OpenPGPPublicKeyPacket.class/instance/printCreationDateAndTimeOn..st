printing
printCreationDateAndTimeOn: aStream
	| t |
	t := self creationDateAndTime.
	t asDate printOn: aStream format: #(1 2 3 $. 1 1 2).
	aStream space.
	t asTime print24: true on: aStream