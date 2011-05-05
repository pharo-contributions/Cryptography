as yet unclassified
checkPassword: password against: hash
|salt| 
salt := hash copyFrom: 1 to:30.

^hash = (self ffiCrypt: password with: salt).