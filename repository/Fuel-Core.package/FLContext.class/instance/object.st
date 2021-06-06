as yet unclassified
object
	^ self
		at: #object
		ifAbsentPut: [ self configuration object ]