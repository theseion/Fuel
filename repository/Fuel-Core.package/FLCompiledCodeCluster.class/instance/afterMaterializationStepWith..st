protected
afterMaterializationStepWith: aDecoder

	"In the aftermath of the materialization I fix all the class variables to point to the correct ones"
	objects do: [ :aCompiledCode | self fixClassVariableReferencesOf: aCompiledCode ]