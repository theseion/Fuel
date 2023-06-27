tests
testSmallIntegerSerializationForAllBitsWith32Bits
	1
		to: 30
		do: [ :exp |
			| integer |
			integer := 2 raisedTo: exp.
			integer isLarge ifFalse: [
				self
					assertIdentityOf: integer
					using: #(encodeUint32: nextEncodedUint32).
			integer < (2 raisedTo: 30) ifTrue: [
				self
					assertIdentityOf: integer
					using: #(encodeInt32: nextEncodedInt32) ] ].
			integer := 0 - integer.
			integer isLarge ifFalse: [
				self
					assertIdentityOf: integer
					using: #(encodeInt32: nextEncodedInt32) ] ]