system category list
systemCategoryList
	"Answer the sequenceable collection containing the class categories that 
	the receiver accesses."

	| prefix |
	systemCategoryFilter = '' ifTrue: [^ systemOrganizer categories].
	prefix := systemCategoryFilter, '-'.
	^ Array streamContents:
		[:strm |
		systemOrganizer categories do: 
			[ :cat | (cat beginsWith: prefix) ifTrue:
				[strm nextPut: cat]]]