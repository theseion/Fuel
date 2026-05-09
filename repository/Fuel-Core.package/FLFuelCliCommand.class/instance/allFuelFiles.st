accessing
allFuelFiles

	^ (self positional: #FILE ifAbsent: [ #() ]) 
		select: [ :arg | arg endsWith: '.fuel' ]