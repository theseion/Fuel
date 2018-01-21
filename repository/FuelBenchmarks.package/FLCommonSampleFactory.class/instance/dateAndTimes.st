samples
dateAndTimes

	| initialTime initialDate |
	initialTime := Time fromSeconds: 76020.
	initialDate := Date fromSeconds: 3492288000.
	^ (1 to: self problemSize) 
		collect: [:index |
			DateAndTime 
				date: (initialDate subtractDays: index) 
				time: (initialTime addSeconds: index) ].
