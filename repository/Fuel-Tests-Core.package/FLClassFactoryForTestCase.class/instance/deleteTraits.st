private-cleaning
deleteTraits
	self createdTraits do: [:trait|
		self deleteBehavior: trait]