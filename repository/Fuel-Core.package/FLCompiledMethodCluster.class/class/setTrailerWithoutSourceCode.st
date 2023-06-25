configuring
setTrailerWithoutSourceCode
	"Make compiled methods be serialized without source code.
	As of Pharo 12, source code is stored in the #source property
	and no longer the method trailer."

	self transformationForSerializing: [ :aCompiledMethod |
		aCompiledMethod copy clearSourcePointer ]