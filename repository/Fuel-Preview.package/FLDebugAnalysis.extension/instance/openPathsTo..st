*Fuel-Preview
openPathsTo: anObject

	FLGraphViewBuilder new 
		mark: self root with: self rootColor;
		mark: anObject with: self secondaryColor;
		references: (self pathsTo: anObject);
		open