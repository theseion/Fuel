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

[![Build status: Pharo alpha](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-12.0.yaml?branch=Pharo12&label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-12.0.yaml)

master | 5.2.2 | 5.1.0 | 5.0.6 | 4.1.1 | 3.0.4 | 3.0.3 |
 ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------- |
[![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=master&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) | [![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=5.2.2&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) | [![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=5.1.0&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) | [![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=5.0.6&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) | [![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=4.1.1&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) | [![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=3.0.4&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) | [![Build status: Pharo 11.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-11.0.yaml?branch=3.0.3&label=11.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-11.0.yaml) |
[![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=master&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=5.2.2&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=5.1.0&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=5.0.6&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=4.1.1&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=3.0.4&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) | [![Build status: Pharo 10.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-10.0.yaml?branch=3.0.3&label=10.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-10.0.yaml) |
[![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=master&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=5.2.2&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=5.1.0&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=5.0.6&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=4.1.1&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=3.0.4&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) | [![Build status: Pharo 9.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-9.0.yaml?branch=3.0.3&label=9.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-9.0.yaml) |
[![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=master&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=5.2.2&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=5.1.0&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=5.0.6&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=4.1.1&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=3.0.4&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) | [![Build status: Pharo 8.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-8.0.yaml?branch=3.0.3&label=8.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-8.0.yaml) |
[![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=master&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=5.2.2&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=5.1.0&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=5.0.6&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=4.1.1&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=3.0.4&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) | [![Build status: Pharo 7.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/pharo-7.0.yaml?branch=3.0.3&label=7.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/pharo-7.0.yaml) |

### Squeak
master | 5.2.2 | 5.1.0 | 5.0.6 | 4.1.1 | 3.0.4 | 3.0.3 |
------------- | ------------- | ------------- | ------------- | ----------- | ------------ | ------------- |
[![Build status: Squeak alpha](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-alpha.yaml?branch=master&label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) | [![Build status: Squeak alpha](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-alpha.yaml?branch=5.2.2&label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) | [![Build status: Squeak alpha](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-alpha.yaml?branch=5.1.0&label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) | [![Build status: Squeak alpha](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-alpha.yaml?branch=5.0.6&label=alpha&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-alpha.yaml) |
[![Build status: Squeak 6.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-6.0.yaml?branch=master&label=6.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-6.0.yaml) | [![Build status: Squeak 6.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-6.0.yaml?branch=5.2.2&label=6.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-6.0.yaml) | [![Build status: Squeak 6.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-6.0.yaml?branch=5.1.0&label=6.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-6.0.yaml) | [![Build status: Squeak 6.0](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-6.0.yaml?branch=5.0.6&label=6.0&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-6.0.yaml) |
[![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=master&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=5.2.2&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=5.1.0&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=5.0.6&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=4.1.1&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=3.0.4&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) | [![Build status: Squeak 5.3](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.3.yaml?branch=3.0.3&label=5.3&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.3.yaml) |
[![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=master&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=5.2.2&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=5.1.0&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=5.0.6&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=4.1.1&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=3.0.4&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) | [![Build status: Squeak 5.2](https://img.shields.io/github/actions/workflow/status/theseion/fuel/squeak-5.2.yaml?branch=3.0.3&label=5.2&logo=github)](https://github.com/theseion/Fuel/actions/workflows/squeak-5.2.yaml) |

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

## Pharo >= 12
As of Pharo 12, Fuel will no longer be backwards compatible and each version
will live on a separate branch.

```
Metacello new
    repository: 'github://theseion/Fuel:Pharo12/repository';
    baseline: 'Fuel';
    load.
```

## Pharo >= 7.0
```smalltalk
Metacello new
    repository: 'github://theseion/Fuel:5.2.2/repository';
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
    repository: 'github://theseion/Fuel:5.2.2/repository';
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
