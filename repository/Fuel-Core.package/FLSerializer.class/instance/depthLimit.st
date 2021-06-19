accessing
depthLimit
	^ map
		at: #depthLimit
		ifAbsent: [ self class defaultDepthLimit ]