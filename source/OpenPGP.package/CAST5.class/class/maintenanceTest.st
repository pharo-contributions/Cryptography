class initialization
maintenanceTest
	"Careful! on my 233 MHz PowerPC, this takes about 2.5 hours..."
	"Time millisecondsToRun: [CAST5 maintenanceTest ifFalse: [self error: 'maintenance test failed!']]"
	| a b cast mask64 al ar bl br |
	a := 16r0123456712345678234567893456789A.
	b := 16r0123456712345678234567893456789A.
	cast := CAST5 new.
	mask64 := (1 bitShift: 64) - 1.
	1000000 timesRepeat: [
		cast setKey: b.
		al := cast encryptBlock: (a bitShift: -64).
		ar := cast encryptBlock: (a bitAnd: mask64).
		a := (al bitShift: 64) + ar.
		cast setKey: a.
		bl := cast encryptBlock: (b bitShift: -64).
		br := cast encryptBlock: (b bitAnd: mask64).
		b := (bl bitShift: 64) + br].
	^a = 16rEEA9D0A249FD3BA6B3436FB89D6DCA92
		and: [b = 16rB2C95EB00C31AD7180AC05B8E83D696E]