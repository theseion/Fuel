*Fuel-Core
literalsHash
	"Answer a 16-bit checksum of the hashes of the literals."

	^ CRC crc16FromCollection: (ByteArray 
		new: self numLiterals
		streamContents: [ :stream |
			self literalsDo: [ :literal |
				| hash |
				hash := literal hash.
				1
					to: hash bytesCount
					do: [ :byteIndex | stream nextPut: (hash byteAt: byteIndex) ] ] ])