samples
nilAndBooleans
	
	^ (1 to: self problemSize) 
		collect: [ :index | #(nil true false) atWrap: index ]