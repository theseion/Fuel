private-cleaning
cleanUpSystemOrganization
	"This method is necessary because we create classes in a non-default environment. The
	SystemOrganization is global and ClassFactoryForTestCase interacts with it to clean out
	categories."

	| categories |
	categories := self packageOrganizer categoriesMatching: self defaultPackageName , '-*'.
	categories do: [ :category |
		(self packageOrganizer listAtCategoryNamed: category) do: [ :behaviorName |
			self packageOrganizer removeBehavior: behaviorName ] ]