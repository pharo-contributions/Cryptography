This class holds data describing a public key. Subclasses exist for OpenPGP V3 and V4 formats.

Instance Variables:
creationTime			<Integer> number of seconds since 1.1.1970 GMT (presumably)
publicKeyAlgorithm		<Integer> number of public key algorithm. See RFC2440 for possible values.
algorithmSpecificData	<Array of: Integer> data specifying the key in the chosen public key algorithm
fingerprint				<ByteArray> hash of the key's data, used to verify the authenticity of a key via phone etc. 