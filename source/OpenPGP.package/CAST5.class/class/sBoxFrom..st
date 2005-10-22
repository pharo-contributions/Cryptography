class initialization
sBoxFrom: aString
	| str box value |
	str := ReadStream on: aString.
	box := Array new: 256.
	1 to: 256 do: [:i |
		str skipSeparators.
		value := (Integer
				readFrom: (ReadStream on: (str next: 8) asUppercase)
				base: 16).
		box at: i put: (ThirtyTwoBitRegister new load: value)].
	str atEnd ifFalse: [self error: 'S-Box initialization data corrupt'].
	^box