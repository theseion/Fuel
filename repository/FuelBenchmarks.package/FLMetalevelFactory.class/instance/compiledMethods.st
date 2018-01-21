samples
compiledMethods

	| methods |
	methods := self fewSystemClasses inject: Array new into: [ :array :aClass | array, aClass methods ].
	
	^ (1 to: self problemSize)
		collect: [ :i | (methods atWrap: i) copy ]
