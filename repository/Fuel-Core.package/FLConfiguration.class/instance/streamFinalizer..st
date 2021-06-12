accessing
streamFinalizer: aBlock
	map
		at: #streamFinalizer
		ifPresent: [ :finalizer |
			self
				at: #streamFinalize
				put: [ :stream |
					aBlock value: stream.
					finalizer value: stream ] ]
		ifAbsentPut: [ aBlock ]