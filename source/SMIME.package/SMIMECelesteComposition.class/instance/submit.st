api
submit

	| newMessageNumber personalCeleste windows |

	personalCeleste := false.
	celeste ifNil: [
		personalCeleste := true.
		celeste := Celeste open.
	].

	newMessageNumber := celeste queueMessageWithText: self buildMessage.
	celeste sendMail: {newMessageNumber}.

	personalCeleste ifTrue: [
		windows := SystemWindow 
			windowsIn: self currentWorld 
			satisfying: [ :each | each model == celeste].
		celeste close.
		windows do: [ :each | each delete].
	].
	self forgetIt.
