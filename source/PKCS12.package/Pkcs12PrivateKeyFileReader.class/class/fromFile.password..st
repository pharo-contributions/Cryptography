as yet unclassified
fromFile: filename password: aPassword
	"(Pkcs12PrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/usarhiocertpks12.pfx')"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new
		password: aPassword;
		initializeFromFileContents: data.
