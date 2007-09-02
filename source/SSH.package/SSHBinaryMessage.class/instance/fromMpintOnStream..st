conversions
fromMpintOnStream: stream

	| integer length |
	length := (stream next: 4) asInteger.
	integer := (stream next: length) asInteger.
	((integer digitAt: length) allMask: 16r80)
		ifTrue: [^integer twosComplement negated normalize]
		ifFalse: [^integer normalize].

