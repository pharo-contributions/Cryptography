class list
classList
	"Answer an array of the class names of the selected category. Answer an 
	empty array if no selection exists."

	^ self hasSystemCategorySelected 
		ifFalse:
			[Array new]
		ifTrue: [systemOrganizer listAtCategoryNumber:
			(systemOrganizer categories indexOf: self selectedSystemCategoryName asSymbol)]