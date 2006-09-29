class variables
extensionSymbolDictionary
	"	server_name(0), max_fragment_length(1),
             client_certificate_url(2), trusted_ca_keys(3),
             truncated_hmac(4), status_request(5),
          cert_hash_types(6)"

	^ExtensionSymbolDictionary ifNil: [
			ExtensionSymbolDictionary := Dictionary new
				at: 0 put: #server_name;
				at: 1 put: #max_fragment_length;
				at: 2 put: #client_certificate_url;
				at: 3 put: #trusted_ca_keys;
				at: 4 put: #truncated_hmac;
				at: 5 put: #status_request;
				at: 6 put: #cert_hash_types;
				yourself.
			ExtensionSymbolDictionary]