samples
dates

	| initialDate |
	initialDate := Date fromSeconds: 3492288000.
	^ (1 to: self problemSize) 
		collect: [:index | initialDate subtractDays: index ]