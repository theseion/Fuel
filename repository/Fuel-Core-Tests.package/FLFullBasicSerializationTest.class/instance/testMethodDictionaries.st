tests-long
testMethodDictionaries
	"Tests correct serialization of all the method dictionaries in the System package."

	(Smalltalk organization categoriesMatching: 'System*') do: [ :category |
		(Smalltalk organization classesInCategory: category) do: [ :class |
			self resultOfSerializeAndMaterializeMethodDictionary: class methodDictionary ] ]