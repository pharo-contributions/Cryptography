initialize-release
setKey: anInteger
	"anInteger is a CAST key with 128 bits, of which the LSBs may be 0 if a shorter key size is used.
	CAST5 uses 12 rounds for key sizes up to and including 80 bits, and 16 rounds for larger keys. The key size is determined by examining the 48 LSBs of the keys; if they are 0, the key is assumed to be 80 bits or less."
	| mask32 x0 x4 x8 xC z0 z4 z8 zC |
	mask32 := (1 bitShift: 32) - 1.
	shortKey := (anInteger bitAnd: (1 bitShift: 48)-1) = 0.
	k := Array new: 32.
	x0 := ThirtyTwoBitRegister new load: (anInteger bitShift: -96).
	x4 := ThirtyTwoBitRegister new load: ((anInteger bitShift: -64) bitAnd: mask32).
	x8 := ThirtyTwoBitRegister new load: ((anInteger bitShift: -32) bitAnd: mask32).
	xC := ThirtyTwoBitRegister new load: (anInteger bitAnd: mask32).
	1 to: 32 by: 8 do: [:i |
		z0 := x0 copy castXorFrom: S5 index: xC d1; castXorFrom: S6 index: xC d3;
				castXorFrom: S7 index: xC d0; castXorFrom: S8 index: xC d2; castXorFrom: S7 index: x8 d0.
		z4 := x8 copy castXorFrom: S5 index: z0 d0; castXorFrom: S6 index: z0 d2;
				castXorFrom: S7 index: z0 d1; castXorFrom: S8 index: z0 d3; castXorFrom: S8 index: x8 d2.
		z8 := xC copy castXorFrom: S5 index: z4 d3; castXorFrom: S6 index: z4 d2;
				castXorFrom: S7 index: z4 d1; castXorFrom: S8 index: z4 d0; castXorFrom: S5 index: x8 d1.
		zC := x4 copy castXorFrom: S5 index: z8 d2; castXorFrom: S6 index: z8 d1;
				castXorFrom: S7 index: z8 d3; castXorFrom: S8 index: z8 d0; castXorFrom: S6 index: x8 d3.

		i \\ 16 = 1
			ifTrue: [
				k at: i put: ((S5 at: z8 d0+1) copy castXorFrom: S6 index: z8 d1;
						castXorFrom: S7 index: z4 d3; castXorFrom: S8 index: z4 d2; castXorFrom: S5 index: z0 d2).
				k at: i+1 put: ((S5 at: z8 d2+1) copy castXorFrom: S6 index: z8 d3;
						castXorFrom: S7 index: z4 d1; castXorFrom: S8 index: z4 d0; castXorFrom: S6 index: z4 d2).
				k at: i+2 put: ((S5 at: zC d0+1) copy castXorFrom: S6 index: zC d1;
						castXorFrom: S7 index: z0 d3; castXorFrom: S8 index: z0 d2; castXorFrom: S7 index: z8 d1).
				k at: i+3 put: ((S5 at: zC d2+1) copy castXorFrom: S6 index: zC d3;
						castXorFrom: S7 index: z0 d1; castXorFrom: S8 index: z0 d0; castXorFrom: S8 index: zC d0)]
			ifFalse: [
				k at: i put: ((S5 at: z0 d3+1) copy castXorFrom: S6 index: z0 d2;
						castXorFrom: S7 index: zC d0; castXorFrom: S8 index: zC d1; castXorFrom: S5 index: z8 d1).
				k at: i+1 put: ((S5 at: z0 d1+1) copy castXorFrom: S6 index: z0 d0;
						castXorFrom: S7 index: zC d2; castXorFrom: S8 index: zC d3; castXorFrom: S6 index: zC d0).
				k at: i+2 put: ((S5 at: z4 d3+1) copy castXorFrom: S6 index: z4 d2;
						castXorFrom: S7 index: z8 d0; castXorFrom: S8 index: z8 d1; castXorFrom: S7 index: z0 d2).
				k at: i+3 put: ((S5 at: z4 d1+1) copy castXorFrom: S6 index: z4 d0;
						castXorFrom: S7 index: z8 d2; castXorFrom: S8 index: z8 d3; castXorFrom: S8 index: z4 d2)].

		x0 := z8 copy castXorFrom: S5 index: z4 d1; castXorFrom: S6 index: z4 d3;
				castXorFrom: S7 index: z4 d0; castXorFrom: S8 index: z4 d2; castXorFrom: S7 index: z0 d0.
		x4 := z0 copy castXorFrom: S5 index: x0 d0; castXorFrom: S6 index: x0 d2;
				castXorFrom: S7 index: x0 d1; castXorFrom: S8 index: x0 d3; castXorFrom: S8 index: z0 d2.
		x8 := z4 copy castXorFrom: S5 index: x4 d3; castXorFrom: S6 index: x4 d2;
				castXorFrom: S7 index: x4 d1; castXorFrom: S8 index: x4 d0; castXorFrom: S5 index: z0 d1.
		xC := zC copy castXorFrom: S5 index: x8 d2; castXorFrom: S6 index: x8 d1;
				castXorFrom: S7 index: x8 d3; castXorFrom: S8 index: x8 d0; castXorFrom: S6 index: z0 d3.

		i \\ 16 = 1
			ifTrue: [
				k at: i+4 put: ((S5 at: x0 d3+1) copy castXorFrom: S6 index: x0 d2;
						castXorFrom: S7 index: xC d0; castXorFrom: S8 index: xC d1; castXorFrom: S5 index: x8 d0).
				k at: i+5 put: ((S5 at: x0 d1+1) copy castXorFrom: S6 index: x0 d0;
						castXorFrom: S7 index: xC d2; castXorFrom: S8 index: xC d3; castXorFrom: S6 index: xC d1).
				k at: i+6 put: ((S5 at: x4 d3+1) copy castXorFrom: S6 index: x4 d2;
						castXorFrom: S7 index: x8 d0; castXorFrom: S8 index: x8 d1; castXorFrom: S7 index: x0 d3).
				k at: i+7 put: ((S5 at: x4 d1+1) copy castXorFrom: S6 index: x4 d0;
						castXorFrom: S7 index: x8 d2; castXorFrom: S8 index: x8 d3; castXorFrom: S8 index: x4 d3)]
			ifFalse: [
				k at: i+4 put: ((S5 at: x8 d0+1) copy castXorFrom: S6 index: x8 d1;
						castXorFrom: S7 index: x4 d3; castXorFrom: S8 index: x4 d2; castXorFrom: S5 index: x0 d3).
				k at: i+5 put: ((S5 at: x8 d2+1) copy castXorFrom: S6 index: x8 d3;
						castXorFrom: S7 index: x4 d1; castXorFrom: S8 index: x4 d0; castXorFrom: S6 index: x4 d3).
				k at: i+6 put: ((S5 at: xC d0+1) copy castXorFrom: S6 index: xC d1;
						castXorFrom: S7 index: x0 d3; castXorFrom: S8 index: x0 d2; castXorFrom: S7 index: x8 d0).
				k at: i+7 put: ((S5 at: xC d2+1) copy castXorFrom: S6 index: xC d3;
						castXorFrom: S7 index: x0 d1; castXorFrom: S8 index: x0 d0; castXorFrom: S8 index: xC d1)]].
	17 to: 32 do: [:i | k at: i put: ((k at: i) low bitAnd: 31)]