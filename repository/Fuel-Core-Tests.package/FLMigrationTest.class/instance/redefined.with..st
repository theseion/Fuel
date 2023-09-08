running
redefined: aClass with: instanceVariableNames

	^ self classFactory make: [ :aBuilder |
		  aBuilder
			  fillFor: aClass;
			  slotsFromString: instanceVariableNames ]