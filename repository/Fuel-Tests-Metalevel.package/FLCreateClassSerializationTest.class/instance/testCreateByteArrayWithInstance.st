tests
testCreateByteArrayWithInstance
	self flag: #fixIt. 
	"Tests internal materialization of ByteArray together with an instance of it.
	IMPORTANT: this test was disabled because it is dirty and gets broken classes/traits. 
	For more details see: http://code.google.com/p/pharo/issues/detail?id=6308"
	
	"| result |
	self analyzer considerInternalAllBehaviors: (ByteArray withAllSuperclasses removeAll: Collection withAllSuperclasses; yourself).
	
	result := self resultOfSerializeAndMaterialize: (ByteArray with: 42).
	
	self assert: result class name = #ByteArray.
	self assert: result size = 1.
	self assert: result first = 42."