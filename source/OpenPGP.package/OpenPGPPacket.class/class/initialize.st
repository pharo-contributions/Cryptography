class initialization
initialize
	"OpenPGPPacket initialize"
	TagTypes := Array new: 64 withAll: 'user defined'.
	#(	0	'Reserved'
		1	'Public-Key Encrypted Session Key'
		2	'Signature'
		3	'Symmetric-Key Encrypted Session Key'
		4	'One-Pass Signature'
		5	'Secret Key'
		6	'Public Key'
		7	'Secret Subkey'
		8	'Compressed Data'
		9	'Symmetrically Encrypted Data'
		10	'Marker'
		11	'Literal Data'
		12	'Trust'
		13	'User ID'
		14	'Public Subkey'
		17	'Photo ID') pairsDo: [:index :string |
				TagTypes at: index+1 put: string]