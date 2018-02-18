*Fuel-Tests-Core
duringTestCompileSilently: code classified: aCategory
	^ self 
		duringTestCompileSilently: code
		storeSource: true
		classified: aCategory