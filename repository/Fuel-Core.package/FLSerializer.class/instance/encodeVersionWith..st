protected
encodeVersionWith: anEncoder
	| version |
	version := self configuration version.
	anEncoder
		encodeByte: version major;
		encodeByte: version minor;
		encodeByte: version patch
