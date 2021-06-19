accessing
object
	^ map
		at: #object
		ifAbsentPut: [ self configuration object ]