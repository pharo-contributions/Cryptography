as yet unclassified
fromString: aUTF16LEFormatedString

	"this method takes a byte array which is UTF 16 Little Endian formated, which means for ascii digits the ascii value followed by a zero.  'hello' asMSWideString asByteArray a ByteArray(104 0 101 0 108 0 108 0 111 0)."
	"Convert to a ByteArray with the ascii values of the string."
	| contents |
	contents := (aUTF16LEFormatedString convertFromWithConverter: (UTF16TextConverter new useLittleEndian: true)).
	^self new, contents.