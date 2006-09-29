7.4.1.4 Hello Extensions http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   The extension format for extended client hellos and extended server
   hellos is:

         struct {
             ExtensionType extension_type;
             opaque extension_data<0..2^16-1>;
         } Extension;




Dierks & Rescorla            Standards Track                    [Page 40]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   Here:

     - "extension_type" identifies the particular extension type.

     - "extension_data" contains information specific to the particular
   extension type.

   The extension types defined in this document are:

         enum {
             server_name(0), max_fragment_length(1),
             client_certificate_url(2), trusted_ca_keys(3),
             truncated_hmac(4), status_request(5),
          cert_hash_types(6), (65535)
         } ExtensionType;

   The list of defined extension types is maintained by the IANA. The
   current list can be found at XXX (suggest
   http://www.iana.org/assignments/tls-extensions). See sections XXX and
   YYY for more information on how new values are added.


   Note that for all extension types (including those defined in
   future), the extension type MUST NOT appear in the extended server
   hello unless the same extension type appeared in the corresponding
   client hello.  Thus clients MUST abort the handshake if they receive
   an extension type in the extended server hello that they did not
   request in the associated (extended) client hello.

   Nonetheless "server oriented" extensions may be provided in the
   future within this framework - such an extension, say of type x,
   would require the client to first send an extension of type x in the
   (extended) client hello with empty extension_data to indicate that it
   supports the extension type. In this case the client is offering the
   capability to understand the extension type, and the server is taking
   the client up on its offer.

   Also note that when multiple extensions of different types are
   present in the extended client hello or the extended server hello,
   the extensions may appear in any order.  There MUST NOT be more than
   one extension of the same type.

   An extended client hello may be sent both when starting a new session
   and when requesting session resumption.  Indeed a client that
   requests resumption of a session does not in general know whether the
   server will accept this request, and therefore it SHOULD send an
   extended client hello if it would normally do so for a new session.
   In general the specification of each extension type must include a



Dierks & Rescorla            Standards Track                    [Page 41]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   discussion of the effect of the extension both during new sessions
   and during resumed sessions.

   Note also that all the extensions defined in this document are
   relevant only when a session is initiated. When a client includes one
   or more of the defined extension types in an extended client hello
   while requesting session resumption:

     - If the resumption request is denied, the use of the extensions
       is negotiated as normal.

     - If, on the other hand, the older session is resumed, then the
       server MUST ignore the extensions and send a server hello
       containing none of the extension types; in this case the
       functionality of these extensions negotiated during the original
       session initiation is applied to the resumed session.
