accessing
stringToKey: aString numBytes: numBytes
	| b i hash |
	b := 0.
	i := 0.
	hash := 0.
	[b < numBytes] whileTrue: [
		hash := (hash bitShift: self hashBytes * 8) + (self stringToKey: aString preload: i).
		b := b + self hashBytes.
		i := i + 1].
	b > numBytes ifTrue: [hash := hash bitShift: (numBytes - b) * 8].
	"1 to: hash digitLength // 2 do: [:j |
		t := hash digitAt: j.
		hash digitAt: j put: (hash digitAt: hash digitLength+1-j).
		hash digitAt: hash digitLength+1-j put: t]."
	^hash