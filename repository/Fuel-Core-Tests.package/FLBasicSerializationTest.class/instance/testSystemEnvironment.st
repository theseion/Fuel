tests-globals
testSystemEnvironment
	"We want to treat the <Smalltalk globals> instance of SystemEnvironment
	specially but want to serialize all others"

	self assertSerializationEqualityOf: SystemEnvironment new