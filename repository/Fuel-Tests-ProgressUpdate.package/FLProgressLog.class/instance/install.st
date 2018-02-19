logging
install
	"Start listening"

	self jobAnnouncer
		when: JobStart send: #start: to: self;
		when: JobChange send: #current: to: self;
		when: JobEnd send: #end: to: self.