samples
globals

	| globals |	
	globals := FLAnalyzer defaultGlobalSymbols collect: [ :s | Smalltalk globals at: s ].

	^ (1 to: self problemSize) collect: [ :i | globals atWrap: i ].