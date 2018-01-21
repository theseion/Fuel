running
serialize: anObject

	| log result |
	log := FLProgressLog new.
	
	result := [ 
		log install.
		super serialize: anObject ] 
		ensure: [ log uninstall ].	

	self deny: log history isEmpty.
	^ result