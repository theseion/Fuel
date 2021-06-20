running
testConsiderGlobal: anObject
	"With explicit specification of a symbol as global, both value and association keep identity."

	| globalAssociation |
	self serializer lookUpInGlobals: #FLGlobalVariableForTesting.

	self environmentOfTest
		at: #FLGlobalVariableForTesting
		put: anObject.
	globalAssociation := self environmentOfTest associationAt: #FLGlobalVariableForTesting.
	
	self assertSerializationIdentityOf: globalAssociation.
	self assertSerializationIdentityOf: globalAssociation value.