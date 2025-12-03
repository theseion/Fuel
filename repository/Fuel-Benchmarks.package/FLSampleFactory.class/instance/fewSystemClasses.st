private
fewSystemClasses

	^ (PackageOrganizer default packages
		select: [ :each |
			#( 'System' 'Collections' 'SUnit' )
				anySatisfy: [ :prefix | each name beginsWith: prefix ] ])
		flatCollect: [ :each | each classes ] as: Array