encoding
encodeVersion
	| version |
	version := self configuration version.
	self
		encodeByte: version major;
		encodeByte: version minor;
		encodeByte: version patch
