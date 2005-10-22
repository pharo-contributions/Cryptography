Instances of this class represent keyring entries. Their first packet is always a public or secret key packet, and the following packets are additional data (IDs, subkeys) and signatures for that key.

Instance Variables:
packets	<OrderedCollection of: OpenPGPPacket>	packets comprising this key