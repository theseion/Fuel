renaming
renameClass: aClass from: oldName
	overlay
		at: aClass name put: aClass;
		at: oldName put: sentinel