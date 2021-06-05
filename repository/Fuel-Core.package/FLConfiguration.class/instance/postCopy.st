copying
postCopy
	super postCopy.
	
	"Make sure we don't override any of the settings
	in the original map"
	map := map class new
		addAll: map;
		yourself