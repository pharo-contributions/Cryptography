services
getCertificate
	"return an instance of MSCertificate from user selected certificate"
	| aCertificate |
	aCertificate := self openStore getCertificate.
	^aCertificate
	