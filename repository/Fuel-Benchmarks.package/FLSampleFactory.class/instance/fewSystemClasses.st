private
fewSystemClasses
	^ Array streamContents: [ :stream |
		#('System' 'Collections' 'SUnit') do: [ :packageName |
		(SystemOrganization categoriesMatching: packageName, '*') do: [ :category |
			stream nextPutAll: (SystemOrganization classesInCategory: category) ] ] ]