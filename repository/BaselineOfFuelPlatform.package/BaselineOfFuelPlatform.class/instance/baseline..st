baselines
baseline: spec
  <baseline>
  spec
	for: #common
	do: [		
		spec
			postLoadDoIt: #addPostloadHacks;
			package: 'FuelPlatform-Core'.
			
		spec
			group: 'default'
			with: #('FuelPlatform-Core' 'FuelPlatformCurrentGroup') ].
	
	self 
		pharoPackagesAndGroups: spec;
		squeakPackagesAndGroups: spec