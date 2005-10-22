accessing
nextNumber: anInteger
	| result |
	anInteger <= 4 ifTrue: [
		result := 0.
		anInteger timesRepeat: [result := result * 256 + stream next].
		^result].
	result := Integer new: anInteger neg: false.
	anInteger to: 1 by: -1 do: [:i |
		result digitAt: i put: stream next].
	^result normalize