parsing
parseFromStream: aStream 
	"Return a collection of responders encoded in aStream"
	" struct {
             TrustedAuthority trusted_authorities_list<0..2^16-1>;
         } TrustedAuthorities;

         struct {
             IdentifierType identifier_type;
             select (identifier_type) {
                 case pre_agreed: struct {};
                 case key_sha1_hash: SHA1Hash;
                 case x509_name: DistinguishedName;
                 case cert_sha1_hash: SHA1Hash;
             } identifier;
         } TrustedAuthority;

         enum {
             pre_agreed(0), key_sha1_hash(1), x509_name(2),
             cert_sha1_hash(3), (255)
         } IdentifierType;

         opaque DistinguishedName<1..2^16-1>;
"
	| anAthority results athorityStream anAthorityStream |
	results _ OrderedCollection new.
	athorityStream _ (aStream next: (aStream next: 2) asInteger) readStream.
	[athorityStream atEnd] whileFalse: [
		anAthorityStream := (athorityStream next: (athorityStream next: 2) asInteger) readStream.
		anAthority _ self new.
		anAthority identifierType: anAthorityStream next.
		anAthority identifierType = 1 ifTrue: [anAthority keySha1Hash: (anAthorityStream next: 20)].
		anAthority identifierType = 2 ifTrue: [anAthority x509Name: (anAthorityStream next: (anAthorityStream next: 2) asInteger)].
		anAthority identifierType = 3 ifTrue: [anAthority certSha1Hash: (anAthorityStream next: 20)].
		results add: anAthority.
	].
	^results