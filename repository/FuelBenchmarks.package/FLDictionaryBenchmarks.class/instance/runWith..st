testing
runWith: sourceDictionary 

	^ #(copyRecreating: copyRehashing:)
		inject: '' 
		into: [:result :selector | 
			result, 
			selector printString, 
			' run ms = ', 
			[self perform: selector with: sourceDictionary] 
				timeToRun printString ].
