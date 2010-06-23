actions
decryptElement: anArray
	| gamma delta aux |
	gamma := anArray at: 1.
	delta := anArray at: 2.
	aux := gamma raisedTo: (modulo - 1 - secretExponent) modulo: modulo.
	^ aux * delta \\ modulo