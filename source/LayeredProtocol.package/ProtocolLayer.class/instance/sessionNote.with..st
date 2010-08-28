session
sessionNote: aSymbol with: anArgument
	"Tell my session that something has happened.  If I have no session then do nothing."

	session isNil ifFalse: [session note: aSymbol with: anArgument]