accessing
fields
	"Answer the value of fields"

	^ fields ifNil: [fields := self parseFieldNames. fields].