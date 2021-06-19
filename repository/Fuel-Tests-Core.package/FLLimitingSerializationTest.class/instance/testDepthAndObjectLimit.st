tests
testDepthAndObjectLimit
	| root pair materialized |
	root := FLPair new.
	pair := root.
	1
		to: 10
		do: [ :index |
			pair
				left: FLPair new;
				right: (1 to: 10) asArray.
			pair := pair left ].
	
	self serializer
		object: root;
		limitDepthTo: 2;
		limitObjectsTo: 5;
		serialize.
		
	materialized := self materialized.
	self assert: materialized left isNil.
	self assertCollection: materialized right equals: #(nil nil nil nil nil nil nil 8 9 10).