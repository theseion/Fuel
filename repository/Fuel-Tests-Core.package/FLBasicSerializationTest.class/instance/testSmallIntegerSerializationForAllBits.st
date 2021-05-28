tests-numbers
testSmallIntegerSerializationForAllBits
	1
		to: 64
		do: [ :exp |
			| integer |
			integer := 2 raisedTo: exp.
			integer isLarge ifFalse: [
				self assertSerializationIdentityOf: integer ].
			integer := 0 - integer.
			integer isLarge ifFalse: [
				self assertSerializationIdentityOf: integer ] ]

