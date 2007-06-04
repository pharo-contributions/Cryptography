api
sign: mailMsg

	| textMsg contentInfo bodyText sigMsg newMsg |
"	textMsg := MailMessage empty.
	textMsg body: (MIMEDocument 
		contentType: 'text/plain' 
		content: mailMsg body contents).
	textMsg setField: 'content-transfer-encoding' to: (MIMEHeaderValue fromMIMEHeader: '7bit').
	textMsg setField: 'content-type' to: ((MIMEHeaderValue fromMIMEHeader: 'text/plain')
		parameterAt: 'charset' put: 'US-ASCII';
		parameterAt: 'format' put: 'flowed';
		yourself).
"
	contentInfo := self signedContentInfoFrom: mailMsg.
	bodyText := ASN1Stream 
		encode: contentInfo 
		withType: ((ASN1Module name: #cms) find: #ContentInfo).

	sigMsg := MailMessage empty.
	sigMsg body: (MIMEDocument 
		contentType: 'application/pkcs7-signature' 
		content: bodyText asString).
	sigMsg setField: 'content-transfer-encoding' to: (MIMEHeaderValue fromMIMEHeader: 'base64').
	sigMsg setField: 'content-type' to: ((MIMEHeaderValue fromMIMEHeader: 'application/pkcs7-signature')
		parameterAt: 'name' put: 'smime.p7s';
		yourself).
	sigMsg setField: 'content-disposition' to: ((MIMEHeaderValue fromMIMEHeader: 'attachment')
		parameterAt: 'filename' put: 'smime.p7s';
		yourself).

	newMsg := MailMessage empty.
	newMsg parts: (OrderedCollection with: mailMsg with: sigMsg).
	newMsg setField: 'content-type' to: ((MIMEHeaderValue fromMIMEHeader: 'multipart/signed')
		parameterAt: 'micalg' put: 'sha1';
		parameterAt: 'boundary' put: MailMessage generateSeparator;
		parameterAt: 'protocol' put: 'application/pkcs7-signature';
		yourself).
	newMsg setField: 'mime-version' to: (MIMEHeaderValue fromMIMEHeader: '1.0').
	newMsg setField: 'date' to: (MIMEHeaderValue fromMIMEHeader: DateAndTime now printMIMEDayDateAndTime).
	newMsg setField: 'from' to: (MIMEHeaderValue fromMIMEHeader: mailMsg from).
	newMsg setField: 'to' to: (MIMEHeaderValue fromMIMEHeader: mailMsg to).
	newMsg setField: 'subject' to: (MIMEHeaderValue fromMIMEHeader: mailMsg subject).
	newMsg regenerateBodyFromParts.
	newMsg regenerateText.

	^ newMsg
