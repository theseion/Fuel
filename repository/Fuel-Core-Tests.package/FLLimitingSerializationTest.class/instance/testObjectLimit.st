tests
testObjectLimit
	| root pair materialized |
	root := FLPair new.
	pair := root.
	1
		to: 10
		do: [ :index |
			pair
				left: FLPair new;
				right: index.
			pair := pair left ].
	
	self serializer
		object: root;
		limitObjectsTo: 4;
		serialize.
		
	materialized := self materialized.
	self assert: materialized left notNil.
	self assert: materialized right equals: 1.
	self assert: materialized left left isNil.
	self assert: materialized left right equals: 2