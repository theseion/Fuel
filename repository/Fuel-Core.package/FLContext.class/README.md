I hold contextual information relevant to the serialzation and materialization processes.

I make information available to any objects participating in the serialization or materialization process. I know the current configuration and hold a map of objects.

Users should use the TFLConfigurable trait and send #context to themselves to obtain my current instance.