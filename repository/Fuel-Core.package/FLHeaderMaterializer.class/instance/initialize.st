initialization
initialize
	super initialize.
	
	"Copy the current configuration"
	self copyFrom: FLCurrentConfiguration value.
	"Make a deep copy of the map"
	map := map class new
		addAll: map;
		yourself.
		
	self prepare