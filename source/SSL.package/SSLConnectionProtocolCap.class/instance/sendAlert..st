protocol
sendAlert: alert

	| plaintext |
	plaintext := alert asPlaintextRecord.
	plaintext version: self version.
	self send: plaintext.
	alert isFatal ifTrue: [
		self kill.
		self error: alert description].