*Fuel-Core
cleanOuterContext
	"Clean my outerContext preserving just the receiver and method, which are the only needed by a clean block closure. outerContext can already be nil if the block was compiled without context"

	outerContext ifNotNil: [ outerContext := outerContext cleanCopy ]