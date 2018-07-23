accessing
at: key put: typeSpec

	^self typeMap at: key put: (self typeFrom: typeSpec)