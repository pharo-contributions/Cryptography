class initialization
maintenanceTest2
	"Careful! on my 233 MHz PowerPC, this takes a number of minutes..."
	"MessageTally spyOn: [CAST5 maintenanceTest2 ifFalse: [self error: 'maintenance test failed!']]"
	| a b cast mask64 al ar bl br |
	a := 16r0123456712345678234567893456789A.
	b := 16r0123456712345678234567893456789A.
	cast := CAST5 new.
	mask64 := (1 bitShift: 64) - 1.
	1000 timesRepeat: [
		cast setKey: b.
		al := cast encryptBlock: (a bitShift: -64).
		ar := cast encryptBlock: (a bitAnd: mask64).
		a := (al bitShift: 64) + ar.
		cast setKey: a.
		bl := cast encryptBlock: (b bitShift: -64).
		br := cast encryptBlock: (b bitAnd: mask64).
		b := (bl bitShift: 64) + br].
	^a = 16r23F73B14B02A2AD7DFB9F2C35644798D
		and: [b = 16rE5BF37EFF14C456A40B21CE369370A9F]