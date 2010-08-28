protocol
note: aSymbol with: anObject
	"Inform my members that something has happened."

	self do: [:proto | proto note: aSymbol with: anObject].
