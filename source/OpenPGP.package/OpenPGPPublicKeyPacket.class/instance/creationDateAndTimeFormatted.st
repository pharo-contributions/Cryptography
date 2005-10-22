accessing
creationDateAndTimeFormatted
	| str |
	str := WriteStream on: String new.
	self printCreationDateAndTimeOn: str.
	^str contents