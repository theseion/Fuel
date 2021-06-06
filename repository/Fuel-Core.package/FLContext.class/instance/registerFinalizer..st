accessing
registerFinalizer: aBlock
	(self
		at: #finalizers
		ifAbsentPut: [ OrderedCollection new ])
			add: aBlock