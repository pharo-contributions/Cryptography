private
addElement: element

	self elements addLast: element.
	element addedTo: self.
	^element