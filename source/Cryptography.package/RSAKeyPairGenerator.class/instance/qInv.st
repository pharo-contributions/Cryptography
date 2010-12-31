private
qInv

	^qInv ifNil: [ "qInv = 1 / q mod p"
		qInv := (EuclidAlgorithm with: q with: p) doBasicAlgorithm; firstCoefficient.
		qInv < 0 ifTrue: [ qInv := qInv \\ p ].
		qInv ]