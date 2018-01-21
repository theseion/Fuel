private
colorFor: anObject

	^ colors
		at: anObject
		ifAbsent: [self defaultNodeColor]
