baselines
baseline: spec
  <baseline>
  spec
	for: #common
	do: [		
		spec
			postLoadDoIt: #addPostloadHacks;
			package: 'Fuel-Platform-Core'.
			
		spec
			group: 'default'
			with: #('Fuel-Platform-Core' 'FuelPlatformCurrentGroup') ].
	
	self 
		pharoPackagesAndGroups: spec;
		squeakPackagesAndGroups: spec