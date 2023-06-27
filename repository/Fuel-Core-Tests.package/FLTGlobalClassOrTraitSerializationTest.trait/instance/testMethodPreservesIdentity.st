tests
testMethodPreservesIdentity
	"Tests that serialization of a method in a class or trait preserves identity"
	
	| classOrTrait |
	classOrTrait := self newClassOrTrait.
	self classFactory
		silentlyCompile: 'you'
		in: classOrTrait.
	self assertSerializationIdentityOf: classOrTrait >> #you