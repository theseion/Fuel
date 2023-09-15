running
setUp
	super setUp.

	globals := SystemDictionary new: Smalltalk globals size.
	"Can't use #newFrom: because associations must be unique"
	Smalltalk globals keysAndValuesDo: [ :key :value |
		globals
			at: key
			put: value ]