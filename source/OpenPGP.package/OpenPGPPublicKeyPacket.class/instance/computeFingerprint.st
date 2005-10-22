private
computeFingerprint
	| str bits len hash result |
	version <= 3 ifTrue: [
		str := ReadWriteStream on: (ByteArray new: 300).
		self mpis do: [:each |
			bits := each highBit.
			str nextNumber: bits+7//8 put: each].
		str reset.
		hash := MD5 hashStream: str.
		result := 0.
		hash do: [:each | result := (result bitShift: 8) + each].
		^result].
	version = 4 ifTrue: [
		str := ReadWriteStream on: (ByteArray new: 300).
		str
			nextPut: 16r99;
			nextNumber: 2 put: 0;
			nextPut: 4;
			nextNumber: 4 put: creationTime;
			nextPut: publicKeyAlgorithm.
		self mpis do: [:each |
			str nextNumber: 2 put: (bits := each highBit).
			str nextNumber: bits+7//8 put: each].
		len := str position-3.
		str position: 1.
		str nextNumber: 2 put: len.
		str reset.
		^SecureHashAlgorithm new hashStream: str]