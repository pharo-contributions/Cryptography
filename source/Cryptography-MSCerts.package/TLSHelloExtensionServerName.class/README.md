7.4.1.4.1 Server Name Indication http://www.ietf.org/internet-drafts/draft-ietf-tls-rfc4346-bis-01.txt

   [TLS1.1] does not provide a mechanism for a client to tell a server
   the name of the server it is contacting.  It may be desirable for
   clients to provide this information to facilitate secure connections
   to servers that host multiple 'virtual' servers at a single
   underlying network address.

   In order to provide the server name, clients MAY include an extension
   of type "server_name" in the (extended) client hello.  The
   "extension_data" field of this extension SHALL contain
   "ServerNameList" where:

         struct {
             NameType name_type;
             select (name_type) {
                 case host_name: HostName;
             } name;
         } ServerName;

         enum {
             host_name(0), (255)
         } NameType;

         opaque HostName<1..2^16-1>;

         struct {
             ServerName server_name_list<1..2^16-1>
         } ServerNameList;

   Currently the only server names supported are DNS hostnames, however



Dierks & Rescorla            Standards Track                    [Page 42]draft-ietf-tls-rfc4346-bis-01.txt  TLS                         June 2006


   this does not imply any dependency of TLS on DNS, and other name
   types may be added in the future (by an RFC that Updates this
   document).  TLS MAY treat provided server names as opaque data and
   pass the names and types to the application.

   "HostName" contains the fully qualified DNS hostname of the server,
   as understood by the client. The hostname is represented as a byte
   string using UTF-8 encoding [UTF8], without a trailing dot.

   If the hostname labels contain only US-ASCII characters, then the
   client MUST ensure that labels are separated only by the byte 0x2E,
   representing the dot character U+002E (requirement 1 in section 3.1
   of [IDNA] notwithstanding). If the server needs to match the HostName
   against names that contain non-US-ASCII characters, it MUST perform
   the conversion operation described in section 4 of [IDNA], treating
   the HostName as a "query string" (i.e. the AllowUnassigned flag MUST
   be set). Note that IDNA allows labels to be separated by any of the
   Unicode characters U+002E, U+3002, U+FF0E, and U+FF61, therefore
   servers MUST accept any of these characters as a label separator.  If
   the server only needs to match the HostName against names containing
   exclusively ASCII characters, it MUST compare ASCII names case-
   insensitively.

   Literal IPv4 and IPv6 addresses are not permitted in "HostName".  It
   is RECOMMENDED that clients include an extension of type
   "server_name" in the client hello whenever they locate a server by a
   supported name type.

   A server that receives a client hello containing the "server_name"
   extension, MAY use the information contained in the extension to
   guide its selection of an appropriate certificate to return to the
   client, and/or other aspects of security policy.  In this event, the
   server SHALL include an extension of type "server_name" in the
   (extended) server hello.  The "extension_data" field of this
   extension SHALL be empty.

   If the server understood the client hello extension but does not
   recognize the server name, it SHOULD send an "unrecognized_name"
   alert (which MAY be fatal).

   If an application negotiates a server name using an application
   protocol, then upgrades to TLS, and a server_name extension is sent,
   then the extension SHOULD contain the same name that was negotiated
   in the application protocol.  If the server_name is established in
   the TLS session handshake, the client SHOULD NOT attempt to request a
   different server name at the application layer.
