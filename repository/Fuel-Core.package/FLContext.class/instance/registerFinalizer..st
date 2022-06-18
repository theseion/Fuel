finalization
registerFinalizer: aBlock
	(map
		at: #finalizers
		ifAbsentPut: [ OrderedCollection new ])
			add: aBlock