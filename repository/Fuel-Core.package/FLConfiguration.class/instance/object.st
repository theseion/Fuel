accessing
object
	^ map
		at: #object
		ifAbsent: [
			FLConfigurationError signal: 'You need to specify the object you want to serialize.' ]