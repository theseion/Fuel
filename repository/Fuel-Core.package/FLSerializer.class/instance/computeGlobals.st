private
computeGlobals
	"Some globals, like ActiveHand have a nil value in the Smalltalk globals. Therefore, we cannot map nil to globalCluster. We could filter before in #defaultGlobalSymbols but that means that not even the Association will be consider global."
	| values |
	values := IdentitySet new: self globalSymbols size.
	"todo: optimized ugly code"
	self globalSymbols do: [:aSymbol | 
		(self environment 
			at: aSymbol
			ifPresent: [:value | 
				value ifNotNil: [ 
					values add: value ] ]
			ifAbsent: [ aSymbol ]) ].
	^ values