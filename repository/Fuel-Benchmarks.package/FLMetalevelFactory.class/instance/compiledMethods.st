samples
compiledMethods

	| methods |
	methods := self fewSystemClasses
		flatCollect: [ :each | each methods reject: #isNamedPrimitive ]
		as: Array.

	^ (1 to: self problemSize) collect: [ :i | (methods atWrap: i) copy ]