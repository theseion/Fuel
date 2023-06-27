tests-automatic
testFormatFixedToVariable
	"Tests that serializer can tolerate a format change from a *fixed* class to *weak/variable*.
	Notice, however, that the other way around (variable to fixed) doesn't work so far"

	self environmentOfTest
		at: FLPair name
		put: FLPair.
	
	self serialize: FLPair new.
	
	self environmentOfTest
		at: FLPair name
		put: FLWeakClassMock.

	self assert: self materialized size equals: 0