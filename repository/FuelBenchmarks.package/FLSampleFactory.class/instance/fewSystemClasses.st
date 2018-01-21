private
fewSystemClasses

	^ #('System' 'Collections' 'SUnit') 
		inject: Array new 
		into: [:anArray :aName | anArray, (SystemNavigation default allClassesInPackageNamed: aName) ]