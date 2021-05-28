tests
testSmallIntegerSerializationForAllBitsWith8Bits
	1
		to: 7
		do: [ :exp |
			| integer |
			integer := 2 raisedTo: exp.
			self
				assertIdentityOf: integer
				using: #(encodeUint8: nextEncodedUint8) ]