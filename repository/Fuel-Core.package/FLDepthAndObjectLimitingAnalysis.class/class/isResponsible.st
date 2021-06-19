instance creation
isResponsible
	^ self configuration hasDepthLimit and: [
		self configuration hasObjectsLimit ]