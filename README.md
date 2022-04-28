![Fuel](resources/logo-fuel-header.png)

- [Description](#description)
- [Properties](#properties)
- [Installation](#installation)
- [Report bugs](#report-bugs)
- [More documentation](#more-documentation)
# Description
A general-purpose object serialization framework developed in [Pharo](https://pharo.org). Fuel is developed under the [MIT license](http://www.opensource.org/licenses/mit-license.php).
##### Concrete
We don't aspire to have a dialect-interchange format. This enables us to serialize special objects like contexts, block closures, exceptions, compiled methods and classes. Although there are ports to other dialects, Fuel development is Pharo-centric.
##### Flexible
Depending on the context, there could be multiple ways of serializing the same object. For example, a class can be considered either a global or a regular object. In the former case, it will be encoded just its name; in the latter case, the class will be encoded in detail, with its method dictionary, etc.
##### Fast
We worry about to have the best performance. We developed a complete benchmark suite to help analyse the performance with diverse sample sets, as well as compare against other serializers. Our pickling algorithm allows outstanding materialization performance, as well as very good serialization performance too.
##### Object-Oriented Design
From the beginning it was a constraint to have a good object-oriented design and to do not need any special support from the VM. In addition, Fuel has a complete test suite, with a high coverage. We also worry about writing comments on classes and methods.

# Projects using Fuel
We would love to see your project here too ;)!
- [Pharo](http://pharo.org): Fuel comes baked into Pharo
- [Snapdump](https://github.com/zweidenker/snapdump): Create and manage runtime snapshots in Pharo
- [Computer-World](https://github.com/seandenigris/Computer-World): Make computing objects come alive
- [Resources-Live](https://github.com/seandenigris/Resources-Live): Not files, live resources!
- [SimplePersistence](https://github.com/seandenigris/Simple-Persistence): Hassle free model backups
- [Launchpad](https://github.com/ba-st/Launchpad): Application entry point command line handler template for Pharo

# Status of automated builds
### Pharo
master | 5.0.4 | 4.1.1 | 3.0.4 | 3.0.3 | 3.0.2 | 3.0.1 | 3.0.0 | 2.2.0
------------ | ------------ | ------------ | ------------ | ------------- | ------------ | ------------- | ------------ | -------------
[![Build status: Pharo alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%20alpha/master?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-alpha.yaml) | [![Build status: Pharo alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%20alpha/5.0.4?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-alpha.yaml) | [![Build status: Pharo alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%20alpha/4.1.1?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-alpha.yaml) | [![Build status: Pharo alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%20alpha/3.0.4?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-alpha.yaml) | [![Build status: Pharo alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%20alpha/3.0.3?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-alpha.yaml) | - | - | - | - | - |
[![Build status: Pharo 10.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%2010.0/master?label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%2010.0/5.0.4?label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%2010.0/4.1.1?label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%2010.0/3.0.4?label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%2010.0/3.0.3?label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | - | - | - | - | - |
[![Build status: Pharo 9.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%209.0/master?label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%209.0/5.0.4?label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%209.0/4.1.1?label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%209.0/3.0.4?label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%209.0/3.0.3?label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | - | - | - | - | - |
[![Build status: Pharo 8.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%208.0/master?label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%208.0/5.0.4?label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%208.0/4.1.1?label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%208.0/3.0.4?label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%208.0/3.0.3?label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | - | - | - | - | - |
[![Build status: Pharo 7.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%207.0/master?label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%207.0/5.0.4?label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%207.0/4.1.1?label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%207.0/3.0.4?label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Pharo%207.0/3.0.3?label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.2&env=BUILD_NAME=Pharo64-7.0&label=7.0)](http://travis-ci.org/theseion/Fuel) | [![Build status: Pharo 7.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.1&env=BUILD_NAME=Pharo64-7.0&label=7.0)](http://travis-ci.org/theseion/Fuel) | [![Build status: Pharo-7.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.0&env=BUILD_NAME=Pharo-7.0&label=7.0)](http://travis-ci.org/theseion/Fuel) | [![Build status: Pharo-7.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Pharo-7.0&label=7.0)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | - | [![Build status: Pharo-6.1](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Pharo-6.1&label=6.1)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | - | [![Build status: Pharo-6.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Pharo-6.0&label=6.0)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | - | [![Build status: Pharo-5.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Pharo-5.0&label=5.0)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | - | [![Build status: Pharo-4.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Pharo-4.0&label=4.0)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | - | [![Build status: Pharo-3.0](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Pharo-3.0&label=3.0)](http://travis-ci.org/theseion/Fuel)

### Squeak
master | 5.0.4 | 4.1.1 | 3.0.4 | 3.0.3 | 3.0.2 | 3.0.1 | 3.0.0 | 2.2.0
------------- | ------------- | ----------- | ------------ | ------------- | ------------ | ------------- | ------------ | -------------
[![Build status: Squeak alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%20alpha/master?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) | [![Build status: Squeak alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%20alpha/5.0.4?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) | [![Build status: Squeak alpha](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%20alpha/4.1.1?label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) | - | - | - | - | - | - |
[![Build status: Squeak 5.3](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.3/master?label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.3/5.0.4?label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.3/4.1.1?label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.3/3.0.4?label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.3/3.0.3?label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak-5.3, 64-bits](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.2&env=BUILD_NAME=Squeak64-5.3&label=5.3)](http://travis-ci.org/theseion/Fuel) | [![Build status: Squeak-5.3](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.1&env=BUILD_NAME=Squeak64-5.3&label=5.3)](http://travis-ci.org/theseion/Fuel) | - | - |
[![Build status: Squeak 5.2](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.2/master?label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.2/5.0.4?label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.2/4.1.1?label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.2/3.0.4?label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/workflow/status/theseion/fuel/Build%20Squeak%205.2/3.0.3?label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak-5.2, 64-bits](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.2&env=BUILD_NAME=Squeak64-5.2&label=5.2)](http://travis-ci.org/theseion/Fuel) | [![Build status: Squeak-5.2, 64-bits](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.1&env=BUILD_NAME=Squeak64-5.2&label=5.2)](http://travis-ci.org/theseion/Fuel) | [![Build status: Squeak-5.2, 64-bits](http://badges.herokuapp.com/travis/theseion/Fuel?branch=3.0.0&env=BUILD_NAME=Squeak-5.2&label=5.2)](http://travis-ci.org/theseion/Fuel) | - |
| - | - | - | - | - | - | - | - | [![Build status: Squeak-5.1](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Squeak-5.1&label=5.1)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | [![Build status: Squeak-4.6](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Squeak-4.6&label=4.6)](http://travis-ci.org/theseion/Fuel)
| - | - | - | - | - | - | - | - | [![Build status: Squeak-4.5](http://badges.herokuapp.com/travis/theseion/Fuel?branch=2.2.0&env=BUILD_NAME=Squeak-4.5&label=4.5)](http://travis-ci.org/theseion/Fuel)

# Properties
- Binary format.
- Object-Oriented design.
- No special VM-support needed.
- Modular (clear division in packages).
- Can serialize/materialize not only plain objects but also classes, traits, methods, closures, contexts, packages, etc.
- Support for global references.
- Very customizable: ignore certain instance variables, substitute objects by others, pre and post serialization and materialization actions, etc.
- Supports class rename and class reshape.
- Good test coverage (over 700 unit tests).
- Large suite of benchmarks.


# Installation

## Pharo >= 7.0
```smalltalk
Metacello new
    repository: 'github://theseion/Fuel:5.0.4/repository';
    baseline: 'Fuel';
    load.
```

## Pharo >= 3 and <= 6.1
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
(Smalltalk at: #ConfigurationOfFuel) project load: '1.9.4'.
```
</details>

## Squeak >= 5.2
```smalltalk
Metacello new
    repository: 'github://theseion/Fuel:5.0.4/repository';
    baseline: 'Fuel';
    load.
```

## Squeak >= 4.1 and <= 5.1
```smalltalk
Installer monticello
    http: 'http://smalltalkhub.com/mc/Pharo/Fuel/main';
    addPackage: 'ConfigurationOfFuel';
    install.
(Smalltalk at: #ConfigurationOfFuel) load.
```

# Report bugs
You may very well find something that is broken. When you do, please open an issue in the [GitHub bug tracker](https://github.com/theseion/Fuel/issues) and we'll get back to you promptly.

# Documentation
The documentation is generated from this repository and lives [here](https://theseion.github.io/Fuel).

# Origins
Fuel started its life as a thesis project by [@marianopeck](https://github.com/marianopeck) at [RMoD, Inria](https://rmod.inria.fr/web).
[@tinchodias](https://github.com/tinchodias) later worked on it as part of his own work (also at RMoD).


The Fuel team would like to thank RMoD and especially [@Ducasse](https://github.com/Ducasse) for the support and for letting us continue development as an open source project.
