running
testSample: aSample
	"Tests that the result of serialization and materialization has the expected size. Would be nice to check if the result is equal but many classes do not have = well defined for us."

	| result |
	self 
		shouldnt: [ result := self resultOfSerializeAndMaterialize: aSample content ] 
		raise: Error.
	
	self assert: aSample content size = result size.