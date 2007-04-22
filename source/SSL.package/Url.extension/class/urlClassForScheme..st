*ssl
urlClassForScheme: scheme
	(scheme isNil or: [scheme = 'http']) ifTrue: [^HttpUrl].
	scheme = 'ftp' ifTrue: [^FtpUrl].
	scheme = 'file' ifTrue: [^FileUrl].
	scheme = 'mailto' ifTrue: [^MailtoUrl].
	scheme = 'browser' ifTrue: [^BrowserUrl].
	scheme = 'https' ifTrue: [^HttpsUrl].
	^GenericUrl