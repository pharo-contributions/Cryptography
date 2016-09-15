*Cryptography
padded: directionSymbol to: length with: char
	^directionSymbol = #left
		ifTrue: [ self padLeftTo: length with: char ]
		ifFalse: [ self padRightTo: length with: char ]