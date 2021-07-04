I am the abstract superclass of all configurations.

My subclasses implement configuration options specific to certain aspects of the serialization / materialization process.

Any object that needs to access the configuration can do so by using the #TFLConfigurable trait and sending #configuration to itself.