services
getCertificate
	| platform |
	^(platform := SmalltalkImage current platformName) = 'Win32' ifTrue: [
		Win32FFICertificateStore getCertificate
	] ifFalse: [
		self error: platform, ' is not yet supported'.
	].