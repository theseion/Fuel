tests
testSmallIntegerSerializationForAllBitsWith16Bits
	1
		to: 15
		do: [ :exp |
			| integer |
			integer := 2 raisedTo: exp.
			self
				assertIdentityOf: integer
				using: #(encodeUint16: nextEncodedUint16) ]