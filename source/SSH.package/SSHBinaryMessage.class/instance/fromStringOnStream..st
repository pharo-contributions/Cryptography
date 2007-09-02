conversions
fromStringOnStream: stream

	| size |
	size := (stream next: 4) asInteger.
	^ (stream next: size) asString
