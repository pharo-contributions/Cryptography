This class is used to represent OpenPGP packets. There are no subclasses; all type-specific behavior is implemented by the interpretedData inst var. This makes it easier to parse and write OpenPGP files, even if they contain unknown packet types.

Instance Variables:
header			<Integer>		the first byte of the packet
dataSize			<Integer|nil>		size of the data, or nil if the packet has undetermined size
data			<ByteArray>		raw data contents of packet
trust			<ByteArray|nil>	contents of associated trust packed