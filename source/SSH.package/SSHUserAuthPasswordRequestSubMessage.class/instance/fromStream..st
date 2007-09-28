conversions
fromStream: stream

	| hasNewPassword |
	hasNewPassword := stream next > 0.
	self password: (self fromStringOnStream: stream).
	hasNewPassword ifTrue: [
		self newPassword: (self fromStringOnStream: stream)].

