private
byteArrays: eachSize

	^ (1 to: self problemSize * 60 // eachSize)
		collect: [ :each | 
			(1 to: eachSize) collect: [:i | (each + i \\ 256)] as: ByteArray ]