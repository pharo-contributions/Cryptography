accessing
supportedSuites

	"hexCodeStrings := #('000A' '0009' '0004' '0005' '0012' '0013' '0015' '0016' '0018' '001A' '001B')."

	| hexCodeStrings |
	hexCodeStrings := #('000A' '0009' '0012' '0013' '0015' '0016' '0004' '0005' '0018' '001A' '001B').
	^ hexCodeStrings collect: [:e | self cipherSuiteAtHexString: e].
