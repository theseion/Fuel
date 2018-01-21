tests-numbers
testAllRangeOfIntegers

	1 to: 100 do: [:shift |
		self assertSerializationEqualityOrIdentityOf: 1 << shift.
		self assertSerializationEqualityOrIdentityOf: 0 - (1 << shift) ]
