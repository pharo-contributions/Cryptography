private
buildMessage

	| file text msg |
	textFields do: [ :each | each hasUnacceptedEdits ifTrue: [ each accept ] ].
	text := String streamContents: [:str | str
		nextPutAll: 'From: ';
		nextPutAll: celeste account userName; cr;
		nextPutAll: 'To: ';
		nextPutAll: self to; cr;
		nextPutAll: 'Subject: ';
		nextPutAll: self subject; cr;
		cr;
		nextPutAll: self messageText].
	msg := MailMessage from: text.

	self attachments do: [:fileName |
		file := FileStream readOnlyFileNamed: fileName.
		file ifNotNil: [
			file binary.
			msg := msg addAttachmentFrom: file withName: fileName.
			file close]].

	self shouldSign ifTrue: [msg := celeste smimeAgent sign: msg].
	self shouldEncrypt ifTrue: [msg := celeste smimeAgent encrypt: msg].

	^ msg text
