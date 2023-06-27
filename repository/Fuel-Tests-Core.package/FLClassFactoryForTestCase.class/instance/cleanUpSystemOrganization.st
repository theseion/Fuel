private-cleaning
cleanUpSystemOrganization
	"This method is necessary because we create classes in a non-default environment. The
	SystemOrganization is global and ClassFactoryForTestCase interacts with it to clean out
	categories."

	| categories |
	categories := Smalltalk organization categoriesMatching: self defaultPackageName , '-*'.
	categories do: [ :category |
		(Smalltalk organization listAtCategoryNamed: category) do: [ :behaviorName |
			Smalltalk organization removeBehavior: behaviorName ] ]