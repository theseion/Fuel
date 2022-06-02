private-cleaning
cleanUpSystemOrganization
	"This method is necessary because we create classes in a non-default environment. The
	SystemOrganization is global and ClassFactoryForTestCase interacts with it to clean out
	categories."
	| categoriesMatchString categories |
	categoriesMatchString := self defaultPackageName, '-*'.
	categories := SystemOrganization categoriesMatching: categoriesMatchString.
	categories do: [ :category |
		(SystemOrganization listAtCategoryNamed: category) do: [ :behavior |
			SystemOrganization removeElement: behavior ] ]