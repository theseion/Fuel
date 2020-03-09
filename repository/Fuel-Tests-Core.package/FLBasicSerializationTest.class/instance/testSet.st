tests-collections
testSet
	| set materialized |
	set := Set new.
	set add: 10.
	set add: 20.
	set add: 30.
	set add: 30.

	materialized := self resultOfSerializeAndMaterialize: set.
	self assert: set equals: materialized.
	self assert: materialized size equals: 3.
	self assert: (materialized includes: 10).
	self assert: (materialized includes: 20).
	self assert: (materialized includes: 30)