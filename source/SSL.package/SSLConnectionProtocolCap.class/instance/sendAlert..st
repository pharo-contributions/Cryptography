protocol
sendAlert: alert

	| plaintext |
	plaintext := alert asPlaintextRecord.
	plaintext version: self version.
""Transcript show: '
{SSL-ERROR: ' , alert level printString , ':' , alert descriptionCode printString ,  ' - ' , alert description , '}
'. ""

	self send: plaintext.
	alert isFatal ifTrue: [
		self kill.
		self error: alert description].