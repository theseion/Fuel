logging
install
	"Start listening"

	self jobAnnouncer
		on: JobStart send: #start: to: self;
		on: JobChange send: #current: to: self;
		on: JobEnd send: #end: to: self.