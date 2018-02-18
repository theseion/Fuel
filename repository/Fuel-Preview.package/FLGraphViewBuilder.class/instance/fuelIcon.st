logo
fuelIcon
	^ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self fuelIconContents readStream)