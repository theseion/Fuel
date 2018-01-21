*FuelProgressUpdate
fuelProgressUpdateCheckpoints	
	"In old Pharo versions Sets can't include nil."	

	self flag: #todo. "fix in another way"
	^ SystemVersion current highestUpdate < 13000
		ifTrue: [ self asArray copyWithout: nil ]
		ifFalse: [ self ]