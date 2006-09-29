algSymbols
algDictionary
	"self algDictionary keyAtValue: 41984 = #'CALG_RSA_KEYX'"
	^ AlgDictionary
		ifNil: [AlgDictionary := Dictionary new
						at: #'CALG_MD2'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_MD2);
						
						at: #'CALG_MD4'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_MD4);
						
						at: #'CALG_MD5'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_MD5);
						
						at: #'CALG_SHA'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_SHA);
						
						at: #'CALG_SHA1'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_SHA1);
						
						at: #'CALG_MAC'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_MAC);
						
						at: #'CALG_RSA_SIGN'
						put: ((self ALG_CLASS_SIGNATURE bitOr: self ALG_TYPE_RSA)
								bitOr: self ALG_SID_RSA_ANY);
						
						at: #'CALG_DSS_SIGN'
						put: ((self ALG_CLASS_SIGNATURE bitOr: self ALG_TYPE_DSS)
								bitOr: self ALG_SID_DSS_ANY);
						
						at: #'CALG_NO_SIGN'
						put: ((self ALG_CLASS_SIGNATURE bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_ANY);
						
						at: #'CALG_RSA_KEYX'
						put: ((self ALG_CLASS_KEY_EXCHANGE bitOr: self ALG_TYPE_RSA)
								bitOr: self ALG_SID_RSA_ANY);
						
						at: #'CALG_DES'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_DES);
						
						at: #'CALG_3DES_112'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_3DES_112);
						
						at: #'CALG_3DES'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_3DES);
						
						at: #'CALG_DESX'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_DESX);
						
						at: #'CALG_RC2'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_RC2);
						
						at: #'CALG_RC4'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_STREAM)
								bitOr: self ALG_SID_RC4);
						
						at: #'CALG_SEAL'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_STREAM)
								bitOr: self ALG_SID_SEAL);
						
						at: #'CALG_DH_SF'
						put: ((self ALG_CLASS_KEY_EXCHANGE bitOr: self ALG_TYPE_DH)
								bitOr: self ALG_SID_DH_SANDF);
						
						at: #'CALG_DH_EPHEM'
						put: ((self ALG_CLASS_KEY_EXCHANGE bitOr: self ALG_TYPE_DH)
								bitOr: self ALG_SID_DH_EPHEM);
						
						at: #'CALG_AGREEDKEY_ANY'
						put: ((self ALG_CLASS_KEY_EXCHANGE bitOr: self ALG_TYPE_DH)
								bitOr: self ALG_SID_AGREED_KEY_ANY);
						
						at: #'CALG_KEA_KEYX'
						put: ((self ALG_CLASS_KEY_EXCHANGE bitOr: self ALG_TYPE_DH)
								bitOr: self ALG_SID_KEA);
						
						at: #'CALG_HUGHES_MD5'
						put: ((self ALG_CLASS_KEY_EXCHANGE bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_MD5);
						
						at: #'CALG_SKIPJACK'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_SKIPJACK);
						
						at: #'CALG_TEK'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_TEK);
						
						at: #'CALG_CYLINK_MEK'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_CYLINK_MEK);
						
						at: #'CALG_SSL3_SHAMD5'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_SSL3SHAMD5);
						
						at: #'CALG_SSL3_MASTER'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_SSL3_MASTER);
						
						at: #'CALG_SCHANNEL_MASTER_HASH'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_SCHANNEL_MASTER_HASH);
						
						at: #'CALG_SCHANNEL_MAC_KEY'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_SCHANNEL_MAC_KEY);
						
						at: #'CALG_SCHANNEL_ENC_KEY'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_SCHANNEL_ENC_KEY);
						
						at: #'CALG_PCT1_MASTER'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_PCT1_MASTER);
						
						at: #'CALG_SSL2_MASTER'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_SSL2_MASTER);
						
						at: #'CALG_TLS1_MASTER'
						put: ((self ALG_CLASS_MSG_ENCRYPT bitOr: self ALG_TYPE_SECURECHANNEL)
								bitOr: self ALG_SID_TLS1_MASTER);
						
						at: #'CALG_RC5'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_RC5);
						
						at: #'CALG_HMAC'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_HMAC);
						
						at: #'CALG_TLS1PRF'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_TLS1PRF);
						
						at: #'CALG_HASH_REPLACE_OWF'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_HASH_REPLACE_OWF);
						
						at: #'CALG_AES_128'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_AES_128);
						
						at: #'CALG_AES_192'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_AES_192);
						
						at: #'CALG_AES_256'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_AES_256);
						
						at: #'CALG_AES'
						put: ((self ALG_CLASS_DATA_ENCRYPT bitOr: self ALG_TYPE_BLOCK)
								bitOr: self ALG_SID_AES);
						
						at: #'CALG_SHA_256'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_SHA_256);
						
						at: #'CALG_SHA_384'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_SHA_384);
						
						at: #'CALG_SHA_512'
						put: ((self ALG_CLASS_HASH bitOr: self ALG_TYPE_ANY)
								bitOr: self ALG_SID_SHA_512);
						 yourself.
			AlgDictionary]