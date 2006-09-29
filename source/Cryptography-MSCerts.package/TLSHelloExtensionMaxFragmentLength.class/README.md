7.4.1.4.2 Maximum Fragment Length Negotiation http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt    



Dierks & Rescorla            Standards Track                    [Page 43]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   By default, TLS uses fixed maximum plaintext fragment length of 2^14
   bytes.  It may be desirable for constrained clients to negotiate a
   smaller maximum fragment length due to memory limitations or
   bandwidth limitations.

   In order to negotiate smaller maximum fragment lengths, clients MAY
   include an extension of type "max_fragment_length" in the (extended)
   client hello.  The "extension_data" field of this extension SHALL
   contain:

         enum{
             2^9(1), 2^10(2), 2^11(3), 2^12(4), (255)
         } MaxFragmentLength;

   whose value is the desired maximum fragment length.  The allowed
   values for this field are: 2^9, 2^10, 2^11, and 2^12.

   Servers that receive an extended client hello containing a
   "max_fragment_length" extension, MAY accept the requested maximum
   fragment length by including an extension of type
   "max_fragment_length" in the (extended) server hello.  The
   "extension_data" field of this extension SHALL contain
   "MaxFragmentLength" whose value is the same as the requested maximum
   fragment length.

   If a server receives a maximum fragment length negotiation request
   for a value other than the allowed values, it MUST abort the
   handshake with an "illegal_parameter" alert.  Similarly, if a client
   receives a maximum fragment length negotiation response that differs
   from the length it requested, it MUST also abort the handshake with
   an "illegal_parameter" alert.

   Once a maximum fragment length other than 2^14 has been successfully
   negotiated, the client and server MUST immediately begin fragmenting
   messages (including handshake messages), to ensure that no fragment
   larger than the negotiated length is sent.  Note that TLS already
   requires clients and servers to support fragmentation of handshake
   messages.

   The negotiated length applies for the duration of the session
   including session resumptions.

   The negotiated length limits the input that the record layer may
   process without fragmentation (that is, the maximum value of
   TLSPlaintext.length; see [TLS] section 6.2.1).  Note that the output
   of the record layer may be larger.  For example, if the negotiated
   length is 2^9=512, then for currently defined cipher suites and when
   null compression is used, the record layer output can be at most 793



Dierks & Rescorla            Standards Track                    [Page 44]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   bytes: 5 bytes of headers, 512 bytes of application data, 256 bytes
   of padding, and 20 bytes of MAC.  That means that in this event a TLS
   record layer peer receiving a TLS record layer message larger than
   793 bytes may discard the message and send a "record_overflow" alert,
   without decrypting the message.
