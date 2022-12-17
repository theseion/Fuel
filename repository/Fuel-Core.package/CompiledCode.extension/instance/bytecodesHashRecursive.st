*Fuel-Core
bytecodesHashRecursive
	"Answer a 16-bit checksum of the bytecodes."

	^ CRC crc16FromCollection: (ByteArray 
		new: self size 
		streamContents: [ :stream |
			self bytecodesHashBytesDo: [ :byte | stream nextPut: byte ].
			"Closures are literals, so if only the contents of the closure
			change the byte codes of the method will remain identical."
			self innerCompiledBlocksDo: [ :block |
				block bytecodesHashBytesDo: [ :byte | stream nextPut: byte ] ] ])