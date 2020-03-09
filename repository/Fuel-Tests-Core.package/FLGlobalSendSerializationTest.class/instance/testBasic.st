tests
testBasic
	| result |
	self deny: FLGlobalSendMock newInstanceToSerialize equals: FLGlobalSendMock newInstanceToMaterialize.

	result := self resultOfSerializeAndMaterialize: FLGlobalSendMock newInstanceToSerialize.
	self assert: FLGlobalSendMock newInstanceToMaterialize equals: result