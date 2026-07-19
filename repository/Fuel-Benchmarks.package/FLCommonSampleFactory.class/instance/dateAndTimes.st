samples
dateAndTimes

	| initialDate |
	initialDate := Date fromSeconds: 3492288000.
	^ (1 to: self problemSize) collect: [:index |
		DateAndTime 
			date: (initialDate subtractDays: index) 
			time: (Time fromSeconds: index \\ (60*60*24)) ].
