materializing
run
	"Enables early escape, e.g. when only materializing the header"
	stopBlock := [ ^ self context materializedObjects ].
	
	self
		basicRun;
		stop