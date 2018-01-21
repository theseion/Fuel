private
byteStrings: eachSize

	^ (self byteArrays: eachSize)
		collect: [ :each | each asString ]