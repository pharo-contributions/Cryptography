Subclasses implement so-called Feistel ciphers (DES, CAST5, Blowfish). Such ciphers apply a fixed number of transformations to their input data to encrypt. Decryption is achieved by applying the same transformations in reverse.

Instance Variables:
k	<Array of: Integer> data for the different rounds, derived from the encryption key.