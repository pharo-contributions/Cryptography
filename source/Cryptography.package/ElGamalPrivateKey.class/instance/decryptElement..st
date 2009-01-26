actions
decryptElement: anArray
	| gamma delta aux |
	gamma _ anArray at: 1.
	delta _ anArray at: 2.
	aux _ gamma raisedTo: (modulo - 1 - secretExponent) modulo: modulo.
	^ aux * delta \\ modulo