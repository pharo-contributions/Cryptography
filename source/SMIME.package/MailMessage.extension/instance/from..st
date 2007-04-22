*smime
from: aString 
	"Parse aString to initialize myself."

	| parseStream contentType bodyText contentTransferEncoding |

	tokens _ nil.
	text := aString.
	parseStream _ ReadStream on: text.
	contentType _ 'text/plain'.
	contentTransferEncoding _ nil.
	fields := Dictionary new.

	"Extract information out of the header fields"
	self fieldsFrom: parseStream do: 
		[:fName :fValue | 
		"NB: fName is all lowercase"

		fName = 'content-type' ifTrue: [contentType _ (fValue copyUpTo: $;) asLowercase].
		fName = 'content-transfer-encoding' ifTrue: [contentTransferEncoding _ fValue asLowercase].

		(fields at: fName ifAbsentPut: [OrderedCollection new: 1])
			add: (MIMEHeaderValue forField: fName fromString: fValue)].

	"Extract the body of the message"
	bodyText _ parseStream upToEnd.
	contentTransferEncoding = 'base64'
		ifTrue: 
			[bodyText _ Base64MimeConverter mimeDecodeToChars: (ReadStream on: bodyText).
			bodyText _ bodyText contents].
	contentTransferEncoding = 'quoted-printable' ifTrue: [bodyText _ QuotedPrintableMimeConverter  mimeDecode: bodyText as: String].
	body _ MIMEDocument contentType: contentType content: bodyText