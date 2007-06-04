private
toggleSign

	celeste smimeAgent canSign ifFalse: [^ self].
	self shouldSign: self shouldSign not.
