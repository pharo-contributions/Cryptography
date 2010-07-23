support
cookKey: rawPtr to: cookPtr
	"preprocess the key to more useful format"

	| raw0 raw1 cook |
	<var: #cook type: 'unsigned long'>
	<var: #cookPtr type: 'unsigned long *'>
	<var: #rawPtr type: 'unsigned long *'>
	<var: #raw0 type: 'unsigned long'>
	<var: #raw1 type: 'unsigned long'>

	0 to: 15 do: [ :i |
		raw0 := rawPtr at: i*2.
		raw1 := rawPtr at: i*2 + 1.
		cook := (raw0 bitAnd: 16r00FC0000) << 6.
		cook := cook bitOr: (raw0 bitAnd: 16r00000FC0) << 10.
		cook := cook bitOr: (raw1 bitAnd: 16r00FC0000) >> 10.
		cook := cook bitOr: (raw1 bitAnd: 16r00000FC0) >> 6.
		cookPtr at: (i * 2) put: cook.
		cook := (raw0 bitAnd: 16r0003F000) << 12.
		cook := cook bitOr: (raw0 bitAnd: 16r0000003F) << 16.
		cook := cook bitOr: (raw1 bitAnd: 16r0003F000) >> 4.
		cook := cook bitOr: (raw1 bitAnd: 16r0000003F).
		cookPtr at: (i*2+1) put: cook.
		].

