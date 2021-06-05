as yet unclassified
enableLimitObjectsException: aBoolean
	"Setting this to true will force Fuel to signal an exception if the number of objects
	that will be serialized exceeds the limit set via #limitObjectsTo:"

	self
		at: #limitObjectsExceptionEnabled
		put: aBoolean