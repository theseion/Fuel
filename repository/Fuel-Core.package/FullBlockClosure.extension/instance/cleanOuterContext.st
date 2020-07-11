*Fuel-Core
cleanOuterContext
	"For full block closures, an outer context may not be needed, and can complicate materialization if its bytecodes have changed"

	outerContext := nil."
	super cleanOuterContext"