Instances of this class hold parameter data for public key algorithms. Since the algorithms known to OpenPGP all use a number of large integers (MPIs in OpenPGP parlance) an instance variable for these is defined in this class. At the moment, subclasses only differ by the number of MPIs stored.

Instance Variables:
mpis	<Array of: LargePositiveInteger>	MPIs for this algorithm