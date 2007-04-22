as yet unclassified
fromFile: filename
	"(DSAPrivateKeyFileReader fromFile: '/usr/local/ssl/private/dsa.key')"
	"(DSAPrivateKeyFileReader fromFile: '/Users/slosher/Desktop/squeak/certificates/dsa.key')"

	| fs data |
	fs := StandardFileStream fileNamed: filename.
	data := fs contentsOfEntireFile.
	^ self new initializeFromFileContents: data.
