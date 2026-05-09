execution
processFiles

	self allFuelFiles do: [ :name |
		self processFile: (FileSystem disk resolve: name) asFileReference ]