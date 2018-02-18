executing
block4

	^ [:y :z| y at: z ] 
		value: ([:x | x globals ] value: Smalltalk)
		value: #Integer
