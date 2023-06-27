tests
testSmallIntegerSerializationForAllBitsWith64Bits
	1
		to: 60
		do: [ :exp |
			| integer |
			integer := 2 raisedTo: exp.
			integer isLarge ifFalse: [
				self
					assertIdentityOf: integer
					using: #(encodeUint64: nextEncodedUint64).
			integer < (2 raisedTo: 60) ifTrue: [
				self
					assertIdentityOf: integer
					using: #(encodeInt64: nextEncodedInt64) ] ].
			integer := 0 - integer.
			integer isLarge ifFalse: [
				self
					assertIdentityOf: integer
					using: #(encodeInt64: nextEncodedInt64) ] ]