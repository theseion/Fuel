private-cleaning
deleteClasses
	self createdClasses do: [:class|
		self deleteBehavior: class]