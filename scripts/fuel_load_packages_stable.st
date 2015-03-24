"load development"
[ (Smalltalk at: #Gofer) new
	url: 'http://smalltalkhub.com/mc/Pharo/Fuel/main';
	package: 'ConfigurationOfFuel';
	load.
(Smalltalk at: #ConfigurationOfFuel) load ] on: Error do: [
	((Smalltalk at: #Installer) monticello http: 'http://smalltalkhub.com/mc/Pharo/Fuel/') 
		project: 'main';
		package: 'ConfigurationOfFuel';
		install.
		(Smalltalk at: #ConfigurationOfFuel) load ].
		