api
addAttachment
	| fileResult fileName |
	textFields do: [ :each | each hasUnacceptedEdits ifTrue: [ each accept ] ].

	(fileResult := FileList2 modalFileSelector)
		ifNotNil: [
			fileName := fileResult directory fullNameFor: fileResult name.
			self attachments add: fileName.
			self changed: #attachmentsText].
