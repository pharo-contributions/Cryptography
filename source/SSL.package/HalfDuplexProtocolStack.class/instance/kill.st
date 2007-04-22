protocol
kill

	[self notEmpty] whileTrue: [
		self head close. self pop].