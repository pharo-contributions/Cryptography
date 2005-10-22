A S2KSpecifier encodes how cleartext passphrases are converted into encryption keys. See RFC2440 for more info.

Instance Variables:
type			<Integer> 0, 1, or 3. Only 3 is currently supported (iterated and salted s2k)
hashAlgorithm	<Integer> for the hashing algorithm. Only 2 is currently supported (SHA)
salt				<ByteArray> 8 bytes for 'salting' the hashing machinery so that the same passphrase will not yield the same hash.
count			<Integer> number of bytes of repeated passphrase data to process