A PasswordSaltAndStretch is way to increase the entropy of bad passwords.  The idea is to increase the amount of work needed for an attacker to try random passwords.  The class returns two values a hash and a salt value.  The salt value is random data used to calculate the hash.  If the hash is used as a key then store the salt value along with the encrypted data.  Then to calculate the key or verify a password use hashForPassword: aPassword s: theSalt.

So 

| result |
(result := PasswordSaltAndStretch hashForPassword: 'password') = (PasswordSaltAndStretch hashForPassword: 'password' s: result value)  

should be true.

Instance Variables
	r:		<integer>
	s:		<integer>

r
	- the number of rounds used to stretch the password

s
	- salt which is random data used to make the hash unique.  The salt should be stored with encrypted data, or with the hash because it is needed to verify the hash later.
