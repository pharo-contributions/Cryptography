generated
processBuffer: x withState: h

	| a b c d |
	self var: #x type: 'unsigned int*'.
	self var: #h type: 'unsigned int*'.
	self var: #a type: 'unsigned int'.
	self var: #b type: 'unsigned int'.
	self var: #c type: 'unsigned int'.
	self var: #d type: 'unsigned int'.
	a := h at: 0.
	b := h at: 1.
	c := h at: 2.
	d := h at: 3.
	a := a + (((b bitAnd: c) bitOr: (b bitInvert32 bitAnd: d)) + (x at: 0) + 3614090360).
	a := ((a << 7) bitOr: (a >> (32 - 7))) + b. " 1 "
	d := d + (((a bitAnd: b) bitOr: (a bitInvert32 bitAnd: c)) + (x at: 1) + 3905402710).
	d := ((d << 12) bitOr: (d >> (32 - 12))) + a. " 2 "
	c := c + (((d bitAnd: a) bitOr: (d bitInvert32 bitAnd: b)) + (x at: 2) + 606105819).
	c := ((c << 17) bitOr: (c >> (32 - 17))) + d. " 3 "
	b := b + (((c bitAnd: d) bitOr: (c bitInvert32 bitAnd: a)) + (x at: 3) + 3250441966).
	b := ((b << 22) bitOr: (b >> (32 - 22))) + c. " 4 "
	a := a + (((b bitAnd: c) bitOr: (b bitInvert32 bitAnd: d)) + (x at: 4) + 4118548399).
	a := ((a << 7) bitOr: (a >> (32 - 7))) + b. " 5 "
	d := d + (((a bitAnd: b) bitOr: (a bitInvert32 bitAnd: c)) + (x at: 5) + 1200080426).
	d := ((d << 12) bitOr: (d >> (32 - 12))) + a. " 6 "
	c := c + (((d bitAnd: a) bitOr: (d bitInvert32 bitAnd: b)) + (x at: 6) + 2821735955).
	c := ((c << 17) bitOr: (c >> (32 - 17))) + d. " 7 "
	b := b + (((c bitAnd: d) bitOr: (c bitInvert32 bitAnd: a)) + (x at: 7) + 4249261313).
	b := ((b << 22) bitOr: (b >> (32 - 22))) + c. " 8 "
	a := a + (((b bitAnd: c) bitOr: (b bitInvert32 bitAnd: d)) + (x at: 8) + 1770035416).
	a := ((a << 7) bitOr: (a >> (32 - 7))) + b. " 9 "
	d := d + (((a bitAnd: b) bitOr: (a bitInvert32 bitAnd: c)) + (x at: 9) + 2336552879).
	d := ((d << 12) bitOr: (d >> (32 - 12))) + a. " 10 "
	c := c + (((d bitAnd: a) bitOr: (d bitInvert32 bitAnd: b)) + (x at: 10) + 4294925233).
	c := ((c << 17) bitOr: (c >> (32 - 17))) + d. " 11 "
	b := b + (((c bitAnd: d) bitOr: (c bitInvert32 bitAnd: a)) + (x at: 11) + 2304563134).
	b := ((b << 22) bitOr: (b >> (32 - 22))) + c. " 12 "
	a := a + (((b bitAnd: c) bitOr: (b bitInvert32 bitAnd: d)) + (x at: 12) + 1804603682).
	a := ((a << 7) bitOr: (a >> (32 - 7))) + b. " 13 "
	d := d + (((a bitAnd: b) bitOr: (a bitInvert32 bitAnd: c)) + (x at: 13) + 4254626195).
	d := ((d << 12) bitOr: (d >> (32 - 12))) + a. " 14 "
	c := c + (((d bitAnd: a) bitOr: (d bitInvert32 bitAnd: b)) + (x at: 14) + 2792965006).
	c := ((c << 17) bitOr: (c >> (32 - 17))) + d. " 15 "
	b := b + (((c bitAnd: d) bitOr: (c bitInvert32 bitAnd: a)) + (x at: 15) + 1236535329).
	b := ((b << 22) bitOr: (b >> (32 - 22))) + c. " 16 "
	a := a + (((b bitAnd: d) bitOr: (c bitAnd: d bitInvert32)) + (x at: 1) + 4129170786).
	a := ((a << 5) bitOr: (a >> (32 - 5))) + b. " 17 "
	d := d + (((a bitAnd: c) bitOr: (b bitAnd: c bitInvert32)) + (x at: 6) + 3225465664).
	d := ((d << 9) bitOr: (d >> (32 - 9))) + a. " 18 "
	c := c + (((d bitAnd: b) bitOr: (a bitAnd: b bitInvert32)) + (x at: 11) + 643717713).
	c := ((c << 14) bitOr: (c >> (32 - 14))) + d. " 19 "
	b := b + (((c bitAnd: a) bitOr: (d bitAnd: a bitInvert32)) + (x at: 0) + 3921069994).
	b := ((b << 20) bitOr: (b >> (32 - 20))) + c. " 20 "
	a := a + (((b bitAnd: d) bitOr: (c bitAnd: d bitInvert32)) + (x at: 5) + 3593408605).
	a := ((a << 5) bitOr: (a >> (32 - 5))) + b. " 21 "
	d := d + (((a bitAnd: c) bitOr: (b bitAnd: c bitInvert32)) + (x at: 10) + 38016083).
	d := ((d << 9) bitOr: (d >> (32 - 9))) + a. " 22 "
	c := c + (((d bitAnd: b) bitOr: (a bitAnd: b bitInvert32)) + (x at: 15) + 3634488961).
	c := ((c << 14) bitOr: (c >> (32 - 14))) + d. " 23 "
	b := b + (((c bitAnd: a) bitOr: (d bitAnd: a bitInvert32)) + (x at: 4) + 3889429448).
	b := ((b << 20) bitOr: (b >> (32 - 20))) + c. " 24 "
	a := a + (((b bitAnd: d) bitOr: (c bitAnd: d bitInvert32)) + (x at: 9) + 568446438).
	a := ((a << 5) bitOr: (a >> (32 - 5))) + b. " 25 "
	d := d + (((a bitAnd: c) bitOr: (b bitAnd: c bitInvert32)) + (x at: 14) + 3275163606).
	d := ((d << 9) bitOr: (d >> (32 - 9))) + a. " 26 "
	c := c + (((d bitAnd: b) bitOr: (a bitAnd: b bitInvert32)) + (x at: 3) + 4107603335).
	c := ((c << 14) bitOr: (c >> (32 - 14))) + d. " 27 "
	b := b + (((c bitAnd: a) bitOr: (d bitAnd: a bitInvert32)) + (x at: 8) + 1163531501).
	b := ((b << 20) bitOr: (b >> (32 - 20))) + c. " 28 "
	a := a + (((b bitAnd: d) bitOr: (c bitAnd: d bitInvert32)) + (x at: 13) + 2850285829).
	a := ((a << 5) bitOr: (a >> (32 - 5))) + b. " 29 "
	d := d + (((a bitAnd: c) bitOr: (b bitAnd: c bitInvert32)) + (x at: 2) + 4243563512).
	d := ((d << 9) bitOr: (d >> (32 - 9))) + a. " 30 "
	c := c + (((d bitAnd: b) bitOr: (a bitAnd: b bitInvert32)) + (x at: 7) + 1735328473).
	c := ((c << 14) bitOr: (c >> (32 - 14))) + d. " 31 "
	b := b + (((c bitAnd: a) bitOr: (d bitAnd: a bitInvert32)) + (x at: 12) + 2368359562).
	b := ((b << 20) bitOr: (b >> (32 - 20))) + c. " 32 "
	a := a + (((b bitXor: c) bitXor: d) + (x at: 5) + 4294588738).
	a := ((a << 4) bitOr: (a >> (32 - 4))) + b. " 33 "
	d := d + (((a bitXor: b) bitXor: c) + (x at: 8) + 2272392833).
	d := ((d << 11) bitOr: (d >> (32 - 11))) + a. " 34 "
	c := c + (((d bitXor: a) bitXor: b) + (x at: 11) + 1839030562).
	c := ((c << 16) bitOr: (c >> (32 - 16))) + d. " 35 "
	b := b + (((c bitXor: d) bitXor: a) + (x at: 14) + 4259657740).
	b := ((b << 23) bitOr: (b >> (32 - 23))) + c. " 36 "
	a := a + (((b bitXor: c) bitXor: d) + (x at: 1) + 2763975236).
	a := ((a << 4) bitOr: (a >> (32 - 4))) + b. " 37 "
	d := d + (((a bitXor: b) bitXor: c) + (x at: 4) + 1272893353).
	d := ((d << 11) bitOr: (d >> (32 - 11))) + a. " 38 "
	c := c + (((d bitXor: a) bitXor: b) + (x at: 7) + 4139469664).
	c := ((c << 16) bitOr: (c >> (32 - 16))) + d. " 39 "
	b := b + (((c bitXor: d) bitXor: a) + (x at: 10) + 3200236656).
	b := ((b << 23) bitOr: (b >> (32 - 23))) + c. " 40 "
	a := a + (((b bitXor: c) bitXor: d) + (x at: 13) + 681279174).
	a := ((a << 4) bitOr: (a >> (32 - 4))) + b. " 41 "
	d := d + (((a bitXor: b) bitXor: c) + (x at: 0) + 3936430074).
	d := ((d << 11) bitOr: (d >> (32 - 11))) + a. " 42 "
	c := c + (((d bitXor: a) bitXor: b) + (x at: 3) + 3572445317).
	c := ((c << 16) bitOr: (c >> (32 - 16))) + d. " 43 "
	b := b + (((c bitXor: d) bitXor: a) + (x at: 6) + 76029189).
	b := ((b << 23) bitOr: (b >> (32 - 23))) + c. " 44 "
	a := a + (((b bitXor: c) bitXor: d) + (x at: 9) + 3654602809).
	a := ((a << 4) bitOr: (a >> (32 - 4))) + b. " 45 "
	d := d + (((a bitXor: b) bitXor: c) + (x at: 12) + 3873151461).
	d := ((d << 11) bitOr: (d >> (32 - 11))) + a. " 46 "
	c := c + (((d bitXor: a) bitXor: b) + (x at: 15) + 530742520).
	c := ((c << 16) bitOr: (c >> (32 - 16))) + d. " 47 "
	b := b + (((c bitXor: d) bitXor: a) + (x at: 2) + 3299628645).
	b := ((b << 23) bitOr: (b >> (32 - 23))) + c. " 48 "
	a := a + ((c bitXor: (b bitOr: d bitInvert32)) + (x at: 0) + 4096336452).
	a := ((a << 6) bitOr: (a >> (32 - 6))) + b. " 49 "
	d := d + ((b bitXor: (a bitOr: c bitInvert32)) + (x at: 7) + 1126891415).
	d := ((d << 10) bitOr: (d >> (32 - 10))) + a. " 50 "
	c := c + ((a bitXor: (d bitOr: b bitInvert32)) + (x at: 14) + 2878612391).
	c := ((c << 15) bitOr: (c >> (32 - 15))) + d. " 51 "
	b := b + ((d bitXor: (c bitOr: a bitInvert32)) + (x at: 5) + 4237533241).
	b := ((b << 21) bitOr: (b >> (32 - 21))) + c. " 52 "
	a := a + ((c bitXor: (b bitOr: d bitInvert32)) + (x at: 12) + 1700485571).
	a := ((a << 6) bitOr: (a >> (32 - 6))) + b. " 53 "
	d := d + ((b bitXor: (a bitOr: c bitInvert32)) + (x at: 3) + 2399980690).
	d := ((d << 10) bitOr: (d >> (32 - 10))) + a. " 54 "
	c := c + ((a bitXor: (d bitOr: b bitInvert32)) + (x at: 10) + 4293915773).
	c := ((c << 15) bitOr: (c >> (32 - 15))) + d. " 55 "
	b := b + ((d bitXor: (c bitOr: a bitInvert32)) + (x at: 1) + 2240044497).
	b := ((b << 21) bitOr: (b >> (32 - 21))) + c. " 56 "
	a := a + ((c bitXor: (b bitOr: d bitInvert32)) + (x at: 8) + 1873313359).
	a := ((a << 6) bitOr: (a >> (32 - 6))) + b. " 57 "
	d := d + ((b bitXor: (a bitOr: c bitInvert32)) + (x at: 15) + 4264355552).
	d := ((d << 10) bitOr: (d >> (32 - 10))) + a. " 58 "
	c := c + ((a bitXor: (d bitOr: b bitInvert32)) + (x at: 6) + 2734768916).
	c := ((c << 15) bitOr: (c >> (32 - 15))) + d. " 59 "
	b := b + ((d bitXor: (c bitOr: a bitInvert32)) + (x at: 13) + 1309151649).
	b := ((b << 21) bitOr: (b >> (32 - 21))) + c. " 60 "
	a := a + ((c bitXor: (b bitOr: d bitInvert32)) + (x at: 4) + 4149444226).
	a := ((a << 6) bitOr: (a >> (32 - 6))) + b. " 61 "
	d := d + ((b bitXor: (a bitOr: c bitInvert32)) + (x at: 11) + 3174756917).
	d := ((d << 10) bitOr: (d >> (32 - 10))) + a. " 62 "
	c := c + ((a bitXor: (d bitOr: b bitInvert32)) + (x at: 2) + 718787259).
	c := ((c << 15) bitOr: (c >> (32 - 15))) + d. " 63 "
	b := b + ((d bitXor: (c bitOr: a bitInvert32)) + (x at: 9) + 3951481745).
	b := ((b << 21) bitOr: (b >> (32 - 21))) + c. " 64 "
	h at: 0 put: (h at: 0) + a.
	h at: 1 put: (h at: 1) + b.
	h at: 2 put: (h at: 2) + c.
	h at: 3 put: (h at: 3) + d.