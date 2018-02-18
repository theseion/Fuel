tests
testInterval
	"Overriden because some intervals in super implementation are too big for converting to IdentitySet as currently needs FLProgressAnalysis."

	self assertSerializationEqualityOf: (-10 to: 10 by: 5).