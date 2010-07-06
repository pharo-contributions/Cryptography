as yet unclassified
processBuffer: buffer withState: state

	| a b c d e f g h s0 s1 t1 t2 maj ch w |
	self static: false.
	self inline: true.
	self var: #buffer type: #'unsigned int*'.
	self var: #state type: #'unsigned int*'.
	self var: #a type: #'unsigned int'.
	self var: #b type: #'unsigned int'.
	self var: #c type: #'unsigned int'.
	self var: #d type: #'unsigned int'.
	self var: #e type: #'unsigned int'.
	self var: #f type: #'unsigned int'.
	self var: #g type: #'unsigned int'.
	self var: #h type: #'unsigned int'.
	self var: #i type: #'unsigned int'.
	self var: #s0 type: #'unsigned int'.
	self var: #s1 type: #'unsigned int'.
	self var: #t1 type: #'unsigned int'.
	self var: #t2 type: #'unsigned int'.
	self var: #maj type: #'unsigned int'.
	self var: #ch type: #'unsigned int'.
	self var: #w declareC: 'unsigned int w[64]'.
	self 
		copy: (self cCoerce: buffer to: #'char*') 
		into: (self cCoerce: w to: #'char*')
		count: 16.
	self expand: w.
	
	a := state at: 0.
	b := state at: 1.
	c := state at: 2.
	d := state at: 3.
	e := state at: 4.
	f := state at: 5.
	g := state at: 6.
	h := state at: 7.

	0 to: 63 do: [ :i |
		s0 := ((a >> 2) bitOr: (a << (32 - 2)))
			bitXor: (((a >> 13) bitOr: (a << (32 - 13)))
			bitXor: ((a >> 22) bitOr: (a << (32 - 22)))).
		maj := (a bitAnd: b)
			bitXor: ((a bitAnd: c)
			bitXor: (b bitAnd: c)).
		t2 := s0 + maj.
		s1 := ((e >> 6) bitOr: (e << (32 - 6)))
			bitXor: (((e >> 11) bitOr: (e << (32 - 11)))
			bitXor: ((e >> 25) bitOr: (e << (32 - 25)))).
		ch := (e bitAnd: f) bitXor: (e bitInvert32 bitAnd: g).
		t1 := h + s1 + ch + (k at: i) + (w at: i).
		
		h := g.
		g := f.
		f := e.
		e := d + t1.
		d := c.
		c := b.
		b := a.
		a := t1 + t2 ].
	
	state at: 0 put: (state at: 0) + a.
	state at: 1 put: (state at: 1) + b.
	state at: 2 put: (state at: 2) + c.
	state at: 3 put: (state at: 3) + d.
	state at: 4 put: (state at: 4) + e.
	state at: 5 put: (state at: 5) + f.
	state at: 6 put: (state at: 6) + g.
	state at: 7 put: (state at: 7) + h