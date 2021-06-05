analyzing
run

	objectStack push: self configuration object.
	[ objectStack isEmpty ] 
		whileFalse: [ self mapAndTrace: objectStack pop ].
	[ privateObjectStack isEmpty ] 
		whileFalse: [ self privateMapAndTrace: privateObjectStack pop ].