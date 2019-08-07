*Fuel-Tools-Pharo-FileRegistry
serviceFuelMaterialize
	^ SimpleServiceEntry 
		provider: self 
		label: 'Materialize Fuel file'
		selector: #inspectMaterializationFromFileNamed:
		description: 'Materialize objects previously serialized with Fuel'
		buttonLabel: 'materialize'