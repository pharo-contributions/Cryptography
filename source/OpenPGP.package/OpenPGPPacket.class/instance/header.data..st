initialize-release
header: headerInteger data: dataBytes
	header := headerInteger.
	data := dataBytes.
	"self parseData: (OpenPGPStream on: data)"