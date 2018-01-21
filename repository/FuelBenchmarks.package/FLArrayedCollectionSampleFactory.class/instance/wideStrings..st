private
wideStrings: eachSize

	^ (self byteStrings: eachSize)
		collect: [ :each | each asWideString ]