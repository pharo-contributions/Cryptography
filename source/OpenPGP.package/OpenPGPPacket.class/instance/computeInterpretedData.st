accessing
computeInterpretedData
	| class |
	self tag = 13 ifTrue: [
		^data asString].
	self tag = 2 ifTrue: [
		data first = 3 ifTrue: [
			class := OpenPGPSignatureV3Data].
		data first = 4 ifTrue: [
			class := OpenPGPSignatureV4Data]].
	self tag = 3 ifTrue: [
		class := OpenPGPSymmetricKeyEncryptedSessionKeyPacket].
	class == nil ifTrue: [self error: 'No reader class for this packet type/version yet'].
	^class new readFrom: (OpenPGPStream on: data)