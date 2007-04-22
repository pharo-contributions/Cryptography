instance creation
newOnCode: code

	| alert |
	alert := self new.
	code < 20
		ifTrue: [alert level: 1]
		ifFalse: [alert level: 2].
	alert descriptionCode: code.
	^ alert