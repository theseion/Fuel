decoding
nextEncodedClusterClass
	"Cluster classes should always be found, fall back to system globals"
	| className |
	className := self nextEncodedString asSymbol.
	^ globalEnvironment
		at: className
		ifAbsent: [
			self class environment at: className ]