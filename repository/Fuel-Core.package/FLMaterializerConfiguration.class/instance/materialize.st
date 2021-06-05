materializing
materialize
	| materialization |
	materialization := (FLCurrentConfiguration
		value: self
		during: [ self materializer materialize ]).
	self
		at: #materialization
		put: materialization.
		
	^ materialization root