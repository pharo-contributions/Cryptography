*smime
parseParts
	"private -- parse the parts of the message and store them into a collection"

	| parseStream msgStream messages separator |

	"If this is not multipart, store an empty collection"
	self body isMultipart ifFalse: [parts _ #().  ^self].

	"If we can't find a valid separator, handle it as if the message is not multipart"
	separator := self attachmentSeparator.
	separator ifNil: [Transcript show: 'Ignoring bad attachment separater'; cr. parts _ #(). ^self].

	separator := '--', separator withoutTrailingBlanks.
	parseStream _ ReadStream on: self bodyText.

	msgStream _ LimitingLineStreamWrapper on: parseStream delimiter: separator.
	msgStream limitingBlock: [:aLine |
		aLine withoutTrailingBlanks = separator or:			"Match the separator"
		[aLine withoutTrailingBlanks = (separator, '--')]].	"or the final separator with --"

	"Throw away everything up to and including the first separator"
	msgStream upToEnd.
	msgStream skipThisLine.

	"Extract each of the multi-parts as strings"
	messages _ OrderedCollection new.
	[parseStream atEnd]
		whileFalse: 
			[messages add: msgStream upToEnd.
			msgStream skipThisLine].

	parts _ messages collect: [:e | MailMessage from: (e copyFrom: 1 to: e size - 1)]