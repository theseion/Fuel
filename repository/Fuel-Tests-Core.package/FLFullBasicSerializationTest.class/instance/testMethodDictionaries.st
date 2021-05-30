tests-long
testMethodDictionaries
	"Tests correct serialization of all the method dictionaries in the System package."

	(SystemOrganization categoriesMatching: 'System*') do: [ :category |
		(SystemOrganization classesInCategory: category) do: [ :class |
			self resultOfSerializeAndMaterializeMethodDictionary: class methodDictionary ] ]