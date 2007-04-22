encoding
encodeValue: anObject withDERStream: derStream

	| yy mo dd hh mm ss utcDateTime |
	yy :=  anObject year asString copyFrom: 3 to: 4.
	mo :=  anObject month asString padded: #left to: 2 with: $0.
	dd :=  anObject dayOfMonth asString padded: #left to: 2 with: $0.
	hh :=  anObject hour asString padded: #left to: 2 with: $0.
	mm :=  anObject minute asString padded: #left to: 2 with: $0.
	ss :=  anObject seconds asString padded: #left to: 2 with: $0.
	utcDateTime := (yy, mo, dd, hh, mm, ss, 'Z') asByteArray.
	derStream nextPutAll: utcDateTime.

