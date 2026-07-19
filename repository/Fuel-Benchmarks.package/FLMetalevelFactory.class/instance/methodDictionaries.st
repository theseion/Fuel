samples
methodDictionaries

	| methodDicts |
	methodDicts := self fewSystemClasses collect: [ :aClass | aClass methodDict ].

	^ (1 to: self problemSize) collect: [ :i | (methodDicts atWrap: i) copy ]