*Cryptography-RandomAndPrime
destroy
	"destroy this string by replacing every character with a space"
	1 to: self size do: [:i | 
		self at: i put: Character space
	]