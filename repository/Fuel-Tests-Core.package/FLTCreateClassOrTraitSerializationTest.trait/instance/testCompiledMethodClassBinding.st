tests
testCompiledMethodClassBinding
	"The class binding of each CM has to point to a correct Association, which should not be added to Smalltalk globals."
	
	| class materializedClassOrTrait className method1 method2 |	
	class := self newClassOrTrait.
	class duringTestCompileSilently: 'fortyTwo ^42'.
	class duringTestCompileSilently: 'fortyThree ^43'.
	className := class name.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: class.
	method1 := materializedClassOrTrait compiledMethodAt: #fortyTwo.
	method2 := materializedClassOrTrait compiledMethodAt: #fortyThree.

	self assert: className = method1 methodClass name.
	self assert: className = method2 methodClass name.
	self assert: method1 classBinding == method2 classBinding.
	self deny: (Smalltalk globals includesKey: className asSymbol)