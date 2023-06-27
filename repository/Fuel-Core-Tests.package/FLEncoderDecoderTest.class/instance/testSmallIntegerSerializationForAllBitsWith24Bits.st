tests
testSmallIntegerSerializationForAllBitsWith24Bits
	1
		to: 23
		do: [ :exp |
			| integer |
			integer := 2 raisedTo: exp.
			self
				assertIdentityOf: integer
				using: #(encodeUint24: nextEncodedUint24).
			integer < (2 raisedTo: 23) ifTrue: [
				self
					assertIdentityOf: integer
					using: #(encodeInt24: nextEncodedInt24) ].
			integer := 0 - integer.
			self
				assertIdentityOf: integer
				using: #(encodeInt24: nextEncodedInt24) ]