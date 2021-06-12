as yet unclassified
object
	^ map
		at: #object
		ifAbsentPut: [ self configuration object ]