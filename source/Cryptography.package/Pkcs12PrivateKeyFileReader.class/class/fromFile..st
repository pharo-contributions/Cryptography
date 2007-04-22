as yet unclassified
fromFile: filename
	"(Pkcs12PrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/usarhiocertpks12.pfx')"

	| password |
	password := FillInTheBlank requestPassword: 'Enter your password'.
	^ self fromFile: filename password: password.
