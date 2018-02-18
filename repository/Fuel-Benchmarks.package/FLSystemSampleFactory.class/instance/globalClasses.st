samples
globalClasses

	| classes |	
	classes := self fewSystemClasses.

	^ (1 to: self problemSize) collect: [ :i | classes at: 1 + (i \\ 150) ].