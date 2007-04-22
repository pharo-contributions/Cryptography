instance creation
forField: aFieldName onDefinition: aDefinitionString 
	"Return to the sender an object created from aDefintionString with the
	field name aFieldName"
	| fieldInfo definitionContents noCommentsString |
	
	definitionContents := aDefinitionString copyFrom: (aDefinitionString indexOf: ${)
			+ 1 to: (aDefinitionString indexOf: $})
			- 1.
	noCommentsString := String new.
	definitionContents linesDo: [:aLine |
		((aLine indexOfSubCollection: '--') > 0	or: [aLine withBlanksTrimmed isEmpty])
		ifFalse: [noCommentsString := noCommentsString, aLine].
	].
	fieldInfo := (noCommentsString explode: $,)
		detect: [:aField | aField subStrings first = aFieldName] ifNone: [^nil].
	^ self new parseFieldInfo: fieldInfo;
		 yourself