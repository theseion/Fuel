tests
testClassSideMethodPreservesIdentity
	"Tests that serialization of a method in the class-side of a class or trait preserves identity"
	
	| classOrTrait |
	classOrTrait := self newClassOrTrait.
	self classFactory
		silentlyCompile:  'you'
		in: classOrTrait classSide.
	self assertSerializationIdentityOf: classOrTrait classSide >> #you