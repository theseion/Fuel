tests-long
testMethodDictionaries
	"Tests correct serialization of all the method dictionaries in the System package."

	(self packageOrganizer categoriesMatching: 'System*') do: [ :category |
		(self packageOrganizer classesInCategory: category) do: [ :class |
			self resultOfSerializeAndMaterializeMethodDictionary: class methodDictionary ] ]