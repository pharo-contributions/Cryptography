private
toggleSign

	SMIMEAgent new canSign ifFalse: [^ self].
	self shouldSign: self shouldSign not.
