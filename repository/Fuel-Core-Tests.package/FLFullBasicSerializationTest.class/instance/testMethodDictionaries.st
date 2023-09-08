tests-long
testMethodDictionaries
	"Tests correct serialization of all the method dictionaries in the System package."

	((self packageOrganizer packages select: [ :package | package name beginsWith: 'System' ]) flatCollect: [ :package | package definedClasses ]) do: [ :class |
		self resultOfSerializeAndMaterializeMethodDictionary: class methodDictionary ]