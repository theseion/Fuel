tests
testClassSideMethodPreservesIdentity
	"Tests that serialization of a method in the class-side of a class or trait preserves identity"
	
	| class |
	class := self newClass.
	class classSide duringTestCompileSilently: 'you'.
	self assertSerializationIdentityOf: class classSide >> #you