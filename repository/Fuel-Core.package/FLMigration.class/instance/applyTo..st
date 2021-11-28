evaluating
applyTo: aVariablesMapping 
	
	variables associationsDo: [:link |
		aVariablesMapping 
			map: link key 
			to: link value ]