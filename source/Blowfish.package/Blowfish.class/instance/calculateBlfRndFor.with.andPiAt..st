as yet unclassified
calculateBlfRndFor:oneHalf with: otherHalf andPiAt: n
"#define BLFRND(s,p,i,j,n) (i ^= F(s,j) ^ (p)[n])"

	
^ oneHalf bitXor: ((self feistelWith: otherHalf  ) bitXor: (piArray at: n)) .
