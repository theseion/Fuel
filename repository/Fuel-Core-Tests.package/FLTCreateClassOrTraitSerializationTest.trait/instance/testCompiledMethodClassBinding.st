tests
testCompiledMethodClassBinding
	"The class binding of each CM has to point to a correct Association, which should not be added to Smalltalk globals."
	
	| class materializedClassOrTrait className method1 method2 |	
	class := self newClassOrTrait.
	self classFactory
		silentlyCompile:  'fortyTwo ^42' in: class;
		silentlyCompile: 'fortyThree ^43' in: class.
	className := class name.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: class.
	method1 := materializedClassOrTrait compiledMethodAt: #fortyTwo.
	method2 := materializedClassOrTrait compiledMethodAt: #fortyThree.

	self assert: className = method1 methodClass name.
	self assert: className = method2 methodClass name.
	self assert: method1 classBinding == method2 classBinding.
	self deny: (self environmentOfTest includesKey: className asSymbol)