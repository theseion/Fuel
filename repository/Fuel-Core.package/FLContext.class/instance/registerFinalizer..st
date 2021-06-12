accessing
registerFinalizer: aBlock
	(map
		at: #finalizers
		ifAbsentPut: [ OrderedCollection new ])
			add: aBlock