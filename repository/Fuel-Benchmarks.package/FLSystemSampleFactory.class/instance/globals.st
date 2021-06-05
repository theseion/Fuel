samples
globals

	| globals |	
	globals := FLConfiguration defaultGlobalSymbols collect: [ :s |
		self class environment at: s ].

	^ (1 to: self problemSize) collect: [ :i |
		globals atWrap: i ].