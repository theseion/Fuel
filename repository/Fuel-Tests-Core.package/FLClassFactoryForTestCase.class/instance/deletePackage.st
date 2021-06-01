private-cleaning
deletePackage
	| categoriesMatchString |
	categoriesMatchString := self defaultPackageName, '-*'.
	SystemOrganization removeCategoriesMatching: categoriesMatchString