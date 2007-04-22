*cryptography-core-accessing
byte1: hi1 byte2: hi2 byte3: low1 byte4: low2
	hi _ (hi1 bitShift: 8) + hi2.
	low _ (low1 bitShift: 8) + low2.