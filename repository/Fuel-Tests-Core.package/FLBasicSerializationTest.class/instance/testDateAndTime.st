tests
testDateAndTime
	
	| initialTime initialDate |
	initialTime := Time fromSeconds: 76020.
	initialDate := Date fromSeconds: 3492288000.
	self assertSerializationEqualityOf: (DateAndTime date: initialDate time: initialTime).
	
	initialTime := Time hour: 1 minute: 1 second: 0.
	initialDate := Date year: 3050 month: 12 day: 31.
	self assertSerializationEqualityOf: (DateAndTime date: initialDate time: initialTime).
	
	initialTime := Time hour: 1 minute: 1 second: 0.
	initialDate := Date year: 1600 month: 12 day: 31.
	self assertSerializationEqualityOf: (DateAndTime date: initialDate time: initialTime)