[![Fuel](resources/logo-fuel-header.png)](http://rmod.inria.fr/web/software/Fuel)

[![Build Status](https://travis-ci.org/theseion/Fuel.svg?branch=master)](https://travis-ci.org/theseion/Fuel) [![Build status](https://ci.appveyor.com/api/projects/status/74d8sx8mf20v0p83/branch/master?svg=true)](https://ci.appveyor.com/project/theseion/fuel/branch/master)

- [Description](#description)
- [Properties](#properties)
- [Installation](#installation)
- [Report bugs](#report-bugs)
- [More documentation](#more-documentation)

#Description
A general-purpose object serialization framework developed in [Pharo](https://pharo.org). Fuel is developed under the [MIT license](http://www.opensource.org/licenses/mit-license.php).
#####Concrete
We don't aspire to have a dialect-interchange format. This enables us to serialize special objects like contexts, block closures, exceptions, compiled methods and classes. Although there are ports to other dialects, Fuel development is Pharo-centric.
#####Flexible
Depending on the context, there could be multiple ways of serializing the same object. For example, a class can be considered either a global or a regular object. In the former case, it will be encoded just its name; in the latter case, the class will be encoded in detail, with its method dictionary, etc.
#####Fast
We worry about to have the best performance. We developed a complete benchmark suite to help analyse the performance with diverse sample sets, as well as compare against other serializers. Our pickling algorithm allows outstanding materialization performance, as well as very good serialization performance too.
#####Object-Oriented Design
From the beginning it was a constraint to have a good object-oriented design and to do not need any special support from the VM. In addition, Fuel has a complete test suite, with a high coverage. We also worry about writing comments on classes and methods.

#Properties
- Binary format.
- Object-Oriented design.
- No special VM-support needed.
- Modular (clear division in packages).
- Can serialize/materialize not only plain objects but also classes, traits, methods, closures, contexts, packages, etc.
- Support for global references.
- Very customizable: ignore certain instance variables, substitute objects by others, pre and post serialization and materialization actions, etc.
- Supports class rename and class reshape.
- Good test coverage (almost 600 unit tests).
- Large suite of benchmarks.


#Installation

##Pharo >= 3
```smalltalk
Metacello new
    repository: 'http://smalltalkhub.com/mc/Pharo/Fuel/main';
    configuration: 'Fuel';
    load.
```

<details>
  <summary>Pharo < 3</summary>
```smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/Pharo/Fuel/main';
    package: 'ConfigurationOfFuel';
    load.
(Smalltalk at: #ConfigurationOfFuel) load.
```
</details>

<details>
  <summary>Pharo 1.1.1</summary>
```smalltalk
Gofer new
    url: 'http://smalltalkhub.com/mc/Pharo/Fuel/main';
    package: 'ConfigurationOfFuel';
    load.
(Smalltalk at: #ConfigurationOfFuel) project load: '1.9.4.
```
</details>

##Squeak
```smalltalk
Installer monticello
    http: 'http://smalltalkhub.com/mc/Pharo/Fuel/main';
    addPackage: 'ConfigurationOfFuel';
    install.
(Smalltalk at: #ConfigurationOfFuel) load.
```

#Report bugs
You may very well find something that is broken. When you do, please open an issue in the [GitHub bug tracker](https://github.com/theseion/Fuel/issues) and we'll get back to you promptly.

#More documentation
The main hub for documenation is our page at [RMoD, INRIA](http://rmod.inria.fr/web/software/Fuel)
