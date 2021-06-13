accessing
whenBlocks
	^ map
		at: #whenBlocks
		ifAbsent: [ Bag new ]