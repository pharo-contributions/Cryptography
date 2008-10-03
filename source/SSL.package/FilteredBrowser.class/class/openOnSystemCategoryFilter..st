instance creation
openOnSystemCategoryFilter: filter
	"FilteredBrowser openOnSystemCategoryFilter: 'SqueakElib'."

	| newBrowser |
	newBrowser := self new.
	newBrowser systemCategoryFilter: filter.
	self 
		openBrowserView: (newBrowser openEditString: nil)
		label: 'Classes in category ', newBrowser systemCategoryFilter.
	^ newBrowser