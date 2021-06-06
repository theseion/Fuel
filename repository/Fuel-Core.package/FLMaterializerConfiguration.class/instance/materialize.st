materializing
materialize
	| materialization |
	materialization := self useDuring: [
		self materializer materialize ].
	self
		at: #materialization
		put: materialization.
		
	^ materialization root