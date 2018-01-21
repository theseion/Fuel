benchmarking
benchs

	(self class methodsInCategory: 'executing')
		do: [:m |
			Transcript 
				cr; 
				show: m printString;
				show: '->'.
			[self perform: m] bench printOn: Transcript ].
	Transcript flush.