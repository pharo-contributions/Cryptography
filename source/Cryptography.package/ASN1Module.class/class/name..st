instance creation
name: aSymbol
	"ASN1Module name: #x509"

	| mod |
	^ self modules
		at: aSymbol
		ifAbsent: [
			mod := self new
				name: aSymbol;
				yourself.
			self modules at: mod name put: mod.
			mod].
