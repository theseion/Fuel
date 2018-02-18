*Fuel-Metalevel
identityIncludesAssociation: anAssociation
	^ (self   
	      associationAt: anAssociation key
	      ifAbsent: [ ^ false ]) == anAssociation
