*Fuel-Core
recursiveBytecodesHash
	"Answer a 16-bit checksum of the bytecodes.
	Closures are literals, so if only the contents of the closure
	change the byte codes of the method will remain identical.
	Detect such changes by recursing through closures and hashing
	their literals."

	^ CRC crc16FromCollection: (ByteArray 
		new: self size 
		streamContents: [ :stream |
			self bytecodesHashBytesDo: [ :byte | stream nextPut: byte ].
			self innerCompiledBlocksDo: [ :block |
				block bytecodesHashBytesDo: [ :byte | stream nextPut: byte ] ] ])