initialize-release
setKey: aNumber
	| mask64 |
	mask64 := 16rFFFFFFFFFFFFFFFF.
	des1 := DESForOpenPGP new setKey: ((aNumber bitShift: -128) bitAnd: mask64).
	des2 := DESForOpenPGP new setKey: ((aNumber bitShift: -64) bitAnd: mask64).
	des3 := DESForOpenPGP new setKey: (aNumber bitAnd: mask64)