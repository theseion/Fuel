tests-streams
testReadStream
	| aReadStream materialized |
	aReadStream := ReadStream on: 'A'.

	materialized := self resultOfSerializeAndMaterialize: aReadStream.

	self assert: $A equals: aReadStream next.

	self deny: materialized atEnd.
	self assert: $A equals: materialized next.
	self assert: materialized atEnd