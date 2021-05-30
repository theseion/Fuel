tests
testMethodPreservesIdentity
	"Tests that serialization of a method in a class or trait preserves identity"
	
	| class |
	class := self newClass.
	class duringTestCompileSilently: 'you'.
	self assertSerializationIdentityOf: class >> #you