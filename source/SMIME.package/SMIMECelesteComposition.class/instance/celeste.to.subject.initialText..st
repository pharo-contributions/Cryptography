private
celeste: aCeleste to: argTo subject: argSubject initialText: aText

	celeste := aCeleste.
	to := argTo.
	subject := argSubject.
	messageText := aText.
	shouldEncrypt := false.
	shouldSign := false.
	attachments := OrderedCollection new.
	textFields := #().
