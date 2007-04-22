accessing
password
	"Answer the value of password"

	password isNil 
		ifTrue: [
			password := FillInTheBlank requestPassword: 'Enter the certificate store password:'].
	^ password