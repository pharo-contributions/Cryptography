api
encrypt: mailMsg

	| contentInfo bodyText newMsg |
	contentInfo := self envelopedContentInfoFrom: mailMsg.
	bodyText := ASN1Stream 
		encode: contentInfo 
		withType: ((ASN1Module name: #cms) find: #ContentInfo).
	
	newMsg := MailMessage empty.
	newMsg body: (MIMEDocument 
		contentType: 'application/pkcs7-mime' 
		content: bodyText asString).
	newMsg setField: 'content-type' to: ((MIMEHeaderValue fromMIMEHeader: 'application/pkcs7-mime')
		parameterAt: 'name' put: 'smime.p7m';
		parameterAt: 'smime-type' put: 'enveloped-data';
		yourself).
	newMsg setField: 'content-disposition' to: ((MIMEHeaderValue fromMIMEHeader: 'attachment')
		parameterAt: 'filename' put: 'smime.p7m';
		yourself).
	newMsg setField: 'content-transfer-encoding' to: (MIMEHeaderValue fromMIMEHeader: 'base64').
	newMsg setField: 'mime-version' to: (MIMEHeaderValue fromMIMEHeader: '1.0').
	newMsg setField: 'from' to: (MIMEHeaderValue fromMIMEHeader: mailMsg from).
	newMsg setField: 'to' to: (MIMEHeaderValue fromMIMEHeader: mailMsg to).
	newMsg setField: 'subject' to: (MIMEHeaderValue fromMIMEHeader: mailMsg subject).
	newMsg regenerateText.

	^ newMsg
