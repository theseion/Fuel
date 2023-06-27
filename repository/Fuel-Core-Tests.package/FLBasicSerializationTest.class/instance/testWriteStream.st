tests-streams
testWriteStream
	| aWriteStream materialized |
	aWriteStream := WriteStream on: (ByteArray new: 1).

	materialized := self resultOfSerializeAndMaterialize: aWriteStream.

	aWriteStream nextPut: 1.
	self assert: 1 equals: aWriteStream size.

	self assert: 0 equals: materialized size.
	materialized nextPut: 2.
	self assert: (Array with: 2) equals: materialized contents asArray