accessing
streamFinalizer: aBlock
	map
		at: #streamFinalizer
		ifPresent: [ :finalizer |
			map
				at: #streamFinalize
				put: [ :stream |
					aBlock value: stream.
					finalizer value: stream ] ]
		ifAbsentPut: [ aBlock ]