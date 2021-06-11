Until now, each Fuel version has its own stream format. Furthermore, each version is not compatible with the others. This means that when upgrading Fuel version, we will need to convert our serialized streams. We include below an example of migration. Let's say we have some files serialized with Fuel 1.7 in a Pharo 1.4 image and we want to migrate them to Fuel 1.9.
```smalltalk
 | oldVersion newVersion fileNames objectsByFileName 
   materializerClass serializerClass |
 oldVersion := '1.7'.
 newVersion := '1.9'.
 fileNames := #('a.fuel' 'b.fuel' 'c.fuel' 'd.fuel' 'e.fuel').
 objectsByFileName := Dictionary new.
 

 (ConfigurationOfFuel project version: oldVersion) load.
 materializerClass := Smalltalk at: #FLMaterializer.
 
 fileNames do: [ :fileName | 
 	objectsByFileName 
 		at: fileName 
 		put: (materializerClass materializeFromFileNamed: fileName) ].
 
 
 (ConfigurationOfFuel project version: newVersion) load.
 serializerClass := Smalltalk at: #FLSerializer.
 
 objectsByFileName keysAndValuesDo: [ :fileName :objects |
 	serializerClass 
 		serialize: objects  
 		toFileNamed: 'migrated-', fileName
 	 ].
```
**Note 1:** We assume in this example that the number of objects to migrate can be materialized all together at the same time. This can be false. In such case, we could fix the script to split the list of files and do it in parts.Note 2: It is necessary to fetch the classes in the System Dictionary after the desired Fuel version has been loaded.Note 3: This script should be evaluated in the original image. For example, we don't guarantee that Fuel 1.7 loads in Pharo 2.0, but we know that Fuel 1.9 loads in Pharo 1.4.