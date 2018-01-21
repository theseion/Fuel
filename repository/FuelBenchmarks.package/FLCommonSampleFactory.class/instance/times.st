samples
times

	| initialTime |
	initialTime := Time fromSeconds: 76020.
	^ (1 to: self problemSize) 
		collect: [ :index | initialTime addSeconds: index ].
