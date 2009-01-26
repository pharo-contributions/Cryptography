support
cookKey: rawPtr to: cookPtr
	"preprocess the key to more useful format"

	| raw0 raw1 cook |
	self var: 'cook' declareC: 'unsigned long cook'.
	self var: 'cookPtr' declareC: 'unsigned long *cookPtr'. "32 words"
	self var: 'rawPtr' declareC: 'unsigned long *rawPtr'. "32 words"
	self var: 'raw0' declareC: 'unsigned long raw0'.
	self var: 'raw1' declareC: 'unsigned long raw1'.
	0 to: 15 do: [ :i |
		raw0 _ rawPtr at: i*2.
		raw1 _ rawPtr at: i*2 + 1.
		cook _ (raw0 bitAnd: 16r00FC0000) << 6.
		cook _ cook bitOr: (raw0 bitAnd: 16r00000FC0) << 10.
		cook _ cook bitOr: (raw1 bitAnd: 16r00FC0000) >> 10.
		cook _ cook bitOr: (raw1 bitAnd: 16r00000FC0) >> 6.
		cookPtr at: (i * 2) put: cook.
		cook _ (raw0 bitAnd: 16r0003F000) << 12.
		cook _ cook bitOr: (raw0 bitAnd: 16r0000003F) << 16.
		cook _ cook bitOr: (raw1 bitAnd: 16r0003F000) >> 4.
		cook _ cook bitOr: (raw1 bitAnd: 16r0000003F).
		cookPtr at: (i*2+1) put: cook.
		].

