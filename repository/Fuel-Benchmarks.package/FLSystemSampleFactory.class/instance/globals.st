samples
globals

	| globals |
	globals := Array streamContents: [ :stream |
		FLConfiguration defaultGlobalSymbols do: [ :each |
			self class environment
				at: each
				ifPresent: [ :value | stream nextPut: value ] ] ].

	^ (1 to: self problemSize) collect: [ :i | globals atWrap: i ]