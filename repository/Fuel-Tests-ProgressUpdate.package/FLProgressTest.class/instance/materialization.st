running
materialization

	| log result |
	log := FLProgressLog new.

	result := [ 
		log install.
		super materialization ]
		ensure: [ log uninstall ].	

	self deny: log history isEmpty.
	^ result